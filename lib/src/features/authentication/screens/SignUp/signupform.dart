import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safarkar/src/constants/colors.dart';
import 'package:safarkar/src/features/authentication/controllers/signupcontroller.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formkey = GlobalKey<FormState>();

    return Form(
      key: _formkey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.name,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "Name",
                hintText: "Enter your Full Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: controller.email,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                hintText: "Enter your Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: controller.phoneno,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.call),
                labelText: "Phone no",
                hintText: "Enter your Contact Number",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: controller.address,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on),
                labelText: "Address",
                hintText: "Enter your Address",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Adjust the color as needed
                  width: 1.0, // Adjust the width as needed
                ),
                borderRadius:
                    BorderRadius.circular(5.0), // Adjust the radius as needed
              ),
              child: GestureDetector(
                child: Row(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 10.0),
                    Obx(() {
                      // Use GetX's Obx widget to observe the birthDateInString change
                      return Text(
                        controller.birthDateInString.value,
                      );
                    }),
                  ],
                ),
                onTap: () => controller.selectDate(
                    context), // Delegate date selection to the controller
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: controller.pass,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: "Password",
                hintText: "Enter your Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    final email = controller.email.text
                        .trim(); // Get the email from the controller
                    final password = controller.pass.text
                        .trim(); // Get the password from the controller
                    controller.registerUser(email,
                        password); // Pass email and password to the controller
                  }
                },
                child: Text("SIGNUP"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: tPrimaryColor,
                  foregroundColor: tDarkColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
