import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/features/authentication/screens/Dashboard.dart';
import 'package:safar_kar/src/features/authentication/screens/welcome/welcome.dart';
import 'package:safar_kar/src/repo/auth_repo/exceptions/signupeandpfailure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, (callback) => _setInitialScreen);
  }

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const welcome())
        : Get.offAll(() => const DashBoard());
  }

  //phone auth
  Future<void> phoneAuth(String phoneno) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneno,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid.');
          } else {
            Get.snackbar('Error', 'Something went wrong, Try again!');
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }

  Future<bool> verifyOtp(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(String email, String pass) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      // firebaseUser.value != null
      //     ? Get.offAll(() => const DashBoard())
      //     : Get.offAll(() => const welcome());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEandPFailure.code(e.code);
      debugPrint("FIREBASE AUTH EXCEPTION - ${ex.msg}");
      throw ex;
    } catch (_) {
      const ex = SignUpEandPFailure();
      debugPrint("EXCEPTION - ${ex.msg}");
      throw ex;
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
      firebaseUser.value != null
          ? Get.to(() => const DashBoard())
          : Get.to(() => const welcome());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEandPFailure.code(e.code);
      debugPrint("FIREBASE AUTH EXCEPTION - ${ex.msg}");
      debugPrint("Firebase Error Code: ${e.code}");
      debugPrint("Firebase Error Message: ${e.toString()}");
      throw ex;
    } catch (error) {
      // Handle unknown errors with a generic message.
      final ex = SignUpEandPFailure.custom("An unknown error occurred: $error");
      debugPrint("EXCEPTION - ${ex.msg}");
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
