import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safarkar/src/constants/colors.dart';
import 'package:safarkar/src/constants/image_string.dart';
import 'package:safarkar/src/constants/text.dart';
import 'package:safarkar/src/features/authentication/screens/forgotpass/forgotpassmail.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: "Password",
                hintText: "Enter your Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {}, icon: Icon(Icons.remove_red_eye_sharp))),
          ),
          SizedBox(
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
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tFpTitle,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
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
                                    Get.to(ForgotPassEmail());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20.0),
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
                                SizedBox(
                                  height: 20.0,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(20.0),
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
                          ));
                },
                style: TextButton.styleFrom(foregroundColor: tDarkColor),
                child: Text(
                  "ForgotPassword",
                )),
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("LOGIN"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: tPrimaryColor,
                  foregroundColor: tDarkColor,
                ),
              )),
        ],
      ),
    ));
  }
}
