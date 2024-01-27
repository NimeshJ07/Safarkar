import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/features/authentication/models/user_model.dart';
import 'package:safar_kar/src/features/authentication/screens/forgotpass/forgotpassotp.dart';
import 'package:safar_kar/src/repo/user_repo/user_repo.dart';
import '../../../repo/auth_repo/auth_repos.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final name = TextEditingController();
  final email = TextEditingController();
  final phoneno = TextEditingController();
  final address = TextEditingController();
  final birthDateController = TextEditingController();
  final pass = TextEditingController();

  final userRepo = Get.put(UserRepository());
  RxString birthDateInString = "Select your Birth Date".obs;

  // Method to handle date selection
  Future<void> selectDate(BuildContext context) async {
    final datePick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (datePick != null) {
      // Update the birthDateInString using RxString
      birthDateInString.value =
          "${datePick.month}/${datePick.day}/${datePick.year}";
    }
  }

  void registerUser(String email, String pass) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, pass);
  }

  Future<void> CreateUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthenticate(user.phoneno);
    registerUser(user.email, user.pass);
    Get.to(() => const ForgotPassOtp());
  }

  void phoneAuthenticate(String phoneno) {
    AuthenticationRepository.instance.phoneAuth(phoneno);
  }
}
