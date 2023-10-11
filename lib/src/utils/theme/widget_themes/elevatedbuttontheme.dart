import 'package:flutter/material.dart';
import 'package:safar_kar/src/constants/colors.dart';

class TElevatedButton {
  TElevatedButton._();

  static final lightelevate = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    shape: const RoundedRectangleBorder(),
    foregroundColor: tWhiteColor,
    side: const BorderSide(color: tSecndaryColor),
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    shadowColor: Colors.grey,
    backgroundColor: tSecndaryColor,
    elevation: 0,
  ));
  static final darkelevate = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    shape: const RoundedRectangleBorder(),
    foregroundColor: tSecndaryColor,
    side: const BorderSide(color: tSecndaryColor),
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    shadowColor: Colors.grey,
    backgroundColor: tWhiteColor,
    elevation: 0,
  ));
}
