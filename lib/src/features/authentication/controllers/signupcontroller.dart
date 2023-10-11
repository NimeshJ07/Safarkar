import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safarkar/src/repo/auth_repo/auth_repos.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final name = TextEditingController();
  final email = TextEditingController();
  final phoneno = TextEditingController();
  final address = TextEditingController();
  final birthDateController = TextEditingController();
  final pass = TextEditingController();

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
}
