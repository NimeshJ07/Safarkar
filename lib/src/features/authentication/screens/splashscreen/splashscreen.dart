import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/constants/image_string.dart';
import 'package:safar_kar/src/features/authentication/controllers/splash-screen-controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              bottom: splashController.animate.value ? 300 : 0,
              left: 0, // Set left value as needed
              right: 0, // Set right value as needed
              child: const Center(
                child: Image(image: AssetImage(tSplashImage)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
