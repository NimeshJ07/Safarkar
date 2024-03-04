import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/features/authentication/screens/Login/login.dart';
import '../../../repo/auth_repo/auth_repos.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final isGoogleLoading = false.obs;
  final email = TextEditingController();
  final pass = TextEditingController();

  void loginUser(String email, String pass) {
    AuthenticationRepository.instance.signInWithEmailAndPassword(email, pass);
  }

  void logoutUser() {
    AuthenticationRepository.instance.logout();
  }

  Future<void> googleSignIn() async {
    try {
      isGoogleLoading.value = true;
      final auth = AuthenticationRepository.instance;
      await auth.signInWithGoogle();
      isGoogleLoading.value = false;
      auth.setInitialScreen(auth.firebaseUser());
    } catch (e) {
      isGoogleLoading.value = false;

      String errorMessage = "Login failed";

      if (e is FirebaseAuthException) {
        errorMessage += ": ${e.message}";
      } else {
        errorMessage += ": An unexpected error occurred";
      }

      Get.snackbar("Login failed", errorMessage);
    }
  }
}
