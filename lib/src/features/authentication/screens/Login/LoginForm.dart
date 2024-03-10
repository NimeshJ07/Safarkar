// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/constants/colors.dart';
import 'package:safar_kar/src/constants/text.dart';
import 'package:safar_kar/src/features/authentication/controllers/logincontroller.dart';
import 'package:safar_kar/src/features/authentication/screens/Dashboard.dart';
import 'package:safar_kar/src/features/authentication/screens/forgotpass/forgotpassmail.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final formkey = GlobalKey<FormState>();

    return Form(
      key: formkey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
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
            TextFormField(
              controller: controller.pass,
              obscureText: _obscureText,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  labelText: "Password",
                  hintText: "Enter your Password",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off))),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tFpTitle,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            tFpSubTitle,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Get.to(const ForgotPassEmail());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey.shade200,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.mail_outline_rounded,
                                    size: 60.0,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "E-Mail",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      Text(
                                        temail,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey.shade200,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.mobile_friendly_rounded,
                                    size: 60.0,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Phone no",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      Text(
                                        tcontact,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                style: TextButton.styleFrom(foregroundColor: tDarkColor),
                child: const Text(
                  "ForgotPassword",
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    LoginController.instance.loginUser(
                        controller.email.text.trim(),
                        controller.pass.text.trim());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: tPrimaryColor,
                  foregroundColor: tDarkColor,
                ),
                child: const Text("LOGIN"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
