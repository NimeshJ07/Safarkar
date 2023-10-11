import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/constants/colors.dart';
import 'package:safar_kar/src/constants/image_string.dart';
import 'package:safar_kar/src/constants/text.dart';
import 'package:safar_kar/src/features/authentication/screens/forgotpass/forgotpassotp.dart';

class ForgotPassEmail extends StatelessWidget {
  const ForgotPassEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30.0 * 4,
              ),
              const Image(
                image: AssetImage(tFp),
                height: 30.0 * 4,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Forget Password",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                tFpSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline_outlined),
                          labelText: "Email",
                          hintText: "Enter your Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(const ForgotPassOtp());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tPrimaryColor,
                            foregroundColor: tDarkColor,
                          ),
                          child: const Text("NEXT"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
