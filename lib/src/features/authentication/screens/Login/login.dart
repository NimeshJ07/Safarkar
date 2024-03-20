import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/constants/colors.dart';
import 'package:safar_kar/src/constants/image_string.dart';
import 'package:safar_kar/src/constants/text.dart';
import 'package:safar_kar/src/features/authentication/controllers/logincontroller.dart';
import 'package:safar_kar/src/features/authentication/screens/Login/LoginForm.dart';
import 'package:safar_kar/src/features/authentication/screens/Login/TC.dart';
import 'package:safar_kar/src/features/authentication/screens/SignUp/signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final size = MediaQuery.of(context).size;
    final isLoading = controller
        .isGoogleLoading.value; // Fix: Access isLoading from the controller

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
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
                  tLoginTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(tLoginSubTitle,
                    style: Theme.of(context).textTheme.labelLarge),
                const LoginForm(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(const TC());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      foregroundColor: tDarkColor,
                    ),
                    child: const Text("TICKET CHECKER"),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
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
                        onPressed: isLoading
                            ? null
                            : () {
                                controller.googleSignIn();
                              },
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
                        Get.to(const SignUp());
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: tAcc,
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Sign-Up",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
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
