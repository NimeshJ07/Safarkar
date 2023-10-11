import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safarkar/src/features/authentication/screens/onboard/onboardscreen.dart';
import 'package:safarkar/src/features/authentication/screens/welcome/welcome.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(Duration(microseconds: 500));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 5000));
    Get.to(welcome());
  }
}
