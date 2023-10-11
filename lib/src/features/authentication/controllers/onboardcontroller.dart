import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:safarkar/src/constants/colors.dart';
import 'package:safarkar/src/constants/image_string.dart';
import 'package:safarkar/src/constants/text.dart';
import 'package:safarkar/src/features/authentication/models/model_onboard.dart';
import 'package:safarkar/src/features/authentication/screens/onboard/onboardpage.dart';

class onboardController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardPage(
        model: ModelOnBoard(
      image: tOnBoard1,
      title: tOnBoardTitle1,
      subTitle: tOnBoardSubTitle1,
      cnt: tOnBoardCnt1,
      bgColor: tOnBoard1C,
    )),
    OnBoardPage(
        model: ModelOnBoard(
      image: tOnBoard2,
      title: tOnBoardTitle2,
      subTitle: tOnBoardSubTitle2,
      cnt: tOnBoardCnt2,
      bgColor: tOnBoard2C,
    )),
    OnBoardPage(
        model: ModelOnBoard(
      image: tOnBoard3,
      title: tOnBoardTitle3,
      subTitle: tOnBoardSubTitle3,
      cnt: tOnBoardCnt3,
      bgColor: tOnBoard3C,
    ))
  ];

  void OnPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  skip() => controller.jumpToPage(page: 2);

  animateNext() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
