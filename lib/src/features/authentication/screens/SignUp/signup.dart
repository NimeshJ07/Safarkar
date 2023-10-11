import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/constants/colors.dart';
import 'package:safar_kar/src/constants/image_string.dart';
import 'package:safar_kar/src/constants/text.dart';
import 'package:safar_kar/src/features/authentication/screens/Login/login.dart';
import 'package:safar_kar/src/features/authentication/screens/SignUp/signupform.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage(tLogin),
                  height: size.height * 0.2,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  tSignUpTilte,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(tSignUpSubTitle,
                    style: Theme.of(context).textTheme.labelLarge),
                const SignUpForm(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("OR"),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: const Image(
                          image: AssetImage(tGoogle),
                          width: 20.0,
                        ),
                        onPressed: () {},
                        label: const Text("Sign-in with Google"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: tDarkColor,
                          shape: const RoundedRectangleBorder(),
                          side: const BorderSide(color: tSecndaryColor),
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          shadowColor: Colors.grey,
                          elevation: 0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(const Login());
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: tAcc,
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
