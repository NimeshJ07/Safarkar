import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/features/authentication/screens/Login/login.dart';
import '../../../repo/auth_repo/auth_repos.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final email = TextEditingController();
  final pass = TextEditingController();

  void loginUser(String email, String pass) {
    AuthenticationRepository.instance.signInWithEmailAndPassword(email, pass);
  }
}
