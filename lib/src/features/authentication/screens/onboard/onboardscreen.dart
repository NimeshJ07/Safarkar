import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:safarkar/src/constants/colors.dart';
import 'package:safarkar/src/constants/image_string.dart';
import 'package:safarkar/src/constants/text.dart';
import 'package:safarkar/src/features/authentication/controllers/onboardcontroller.dart';
import 'package:safarkar/src/features/authentication/models/model_onboard.dart';
import 'package:safarkar/src/features/authentication/screens/onboard/onboardpage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obcontroller = onboardController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obcontroller.pages,
            liquidController: obcontroller.controller,
            onPageChangeCallback: obcontroller.OnPageChangeCallback,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
              bottom: 60.0,
              child: OutlinedButton(
                onPressed: () => obcontroller.animateNext(),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black87),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20.0),
                  onPrimary: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                      color: tDarkColor, shape: BoxShape.circle),
                  child: Icon(Icons.arrow_back_ios),
                ),
              )),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                obcontroller.skip();
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Obx(
            () => Positioned(
                bottom: 10,
                child: AnimatedSmoothIndicator(
                  activeIndex: obcontroller.currentPage.value,
                  count: 3,
                  effect: const WormEffect(
                      activeDotColor: Colors.black, dotHeight: 5.0),
                )),
          )
        ],
      ),
    );
  }
}
