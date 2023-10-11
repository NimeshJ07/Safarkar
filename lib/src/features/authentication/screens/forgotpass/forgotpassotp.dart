import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:safarkar/src/constants/colors.dart';
import 'package:safarkar/src/constants/image_string.dart';
import 'package:safarkar/src/constants/text.dart';

class ForgotPassOtp extends StatelessWidget {
  const ForgotPassOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Align(
      alignment: Alignment.center,
      child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.0 * 4,
              ),
              Image(
                image: AssetImage(tOtp),
                height: 30.0 * 4,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                tOtpTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                tOtpSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text("support@gmail.com",
                  style: Theme.of(context).textTheme.labelLarge),
              SizedBox(
                height: 20.0,
              ),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("NEXT"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      foregroundColor: tDarkColor,
                    ),
                  )),
            ],
          )),
    )));
  }
}
