import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safarkar/src/constants/colors.dart';
import 'package:safarkar/src/constants/image_string.dart';
import 'package:safarkar/src/constants/text.dart';
import 'package:safarkar/src/features/authentication/screens/forgotpass/forgotpassotp.dart';

class ForgotPassEmail extends StatelessWidget {
  const ForgotPassEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.0 * 4,
            ),
            Image(
              image: AssetImage(tFp),
              height: 30.0 * 4,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Forget Password",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              tFpSubTitle,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: "Email",
                      hintText: "Enter your Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(ForgotPassOtp());
                        },
                        child: Text("NEXT"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tPrimaryColor,
                          foregroundColor: tDarkColor,
                        ),
                      )),
                ],
              )),
            )
          ],
        ),
      )),
    );
  }
}
