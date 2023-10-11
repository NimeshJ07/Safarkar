import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safarkar/src/constants/colors.dart';
import 'package:safarkar/src/constants/image_string.dart';
import 'package:safarkar/src/constants/text.dart';
import 'package:safarkar/src/features/authentication/screens/Login/LoginForm.dart';
import 'package:safarkar/src/features/authentication/screens/SignUp/signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(tLogin),
                  height: size.height * 0.2,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  tLoginTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(tLoginSubTitle,
                    style: Theme.of(context).textTheme.labelLarge),
                LoginForm(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("OR"),
                    SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: Image(
                          image: AssetImage(tGoogle),
                          width: 20.0,
                        ),
                        onPressed: () {},
                        label: Text("Sign-in with Google"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: tDarkColor,
                          shape: RoundedRectangleBorder(),
                          side: BorderSide(color: tSecndaryColor),
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          shadowColor: Colors.grey,
                          elevation: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(SignUp());
                        },
                        child: Text.rich(
                          TextSpan(
                              text: tAcc,
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                    text: "Sign-Up",
                                    style: TextStyle(color: Colors.blue))
                              ]),
                        ))
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
