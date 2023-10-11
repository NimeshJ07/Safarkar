import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safarkar/src/constants/colors.dart';
import 'package:safarkar/src/constants/image_string.dart';
import 'package:safarkar/src/constants/text.dart';
import 'package:safarkar/src/features/authentication/screens/Login/login.dart';
import 'package:safarkar/src/features/authentication/screens/SignUp/signup.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecndaryColor : tPrimaryColor,
      body: Container(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(
                tWelcome,
              ),
              height: height * 0.6,
            ),
            Column(
              children: [
                Text(
                  tWelTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                Text(
                  tWelSubTitle,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(Login());
                        },
                        child: Text("LOGIN"))),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(SignUp());
                        },
                        child: Text("SIGNUP")))
              ],
            )
          ],
        ),
      ),
    );
  }
}
