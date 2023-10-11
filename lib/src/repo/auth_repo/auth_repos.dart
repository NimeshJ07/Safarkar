import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:safarkar/src/features/authentication/screens/Dashboard.dart';
import 'package:safarkar/src/features/authentication/screens/welcome/welcome.dart';
import 'package:safarkar/src/repo/auth_repo/exceptions/signupeandpfailure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, (callback) => _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const welcome())
        : Get.offAll(() => const DashBoard());
  }

  Future<void> createUserWithEmailAndPassword(String email, String pass) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> loginUserWithEmailAndPassword(String email, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
      firebaseUser.value != null
          ? Get.offAll(() => const DashBoard())
          : Get.offAll(() => const welcome());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEandPFailure.code(e.code);
      print("FIREBASE AUTH EXCEPTION - ${ex.msg}");
      throw ex;
    } catch (_) {
      final ex = SignUpEandPFailure();
      print("EXCEPTION - ${ex.msg}");
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
