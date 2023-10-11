import 'package:flutter/material.dart';
import 'package:safarkar/src/constants/colors.dart';

class TElevatedButton {
  TElevatedButton._();

  static final lightelevate = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(),
    foregroundColor: tWhiteColor,
    side: BorderSide(color: tSecndaryColor),
    padding: EdgeInsets.symmetric(vertical: 15.0),
    shadowColor: Colors.grey,
    backgroundColor: tSecndaryColor,
    elevation: 0,
  ));
  static final darkelevate = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(),
    foregroundColor: tSecndaryColor,
    side: BorderSide(color: tSecndaryColor),
    padding: EdgeInsets.symmetric(vertical: 15.0),
    shadowColor: Colors.grey,
    backgroundColor: tWhiteColor,
    elevation: 0,
  ));
}
