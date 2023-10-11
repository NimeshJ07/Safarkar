import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/constants/colors.dart';
import 'package:safar_kar/src/features/authentication/controllers/signupcontroller.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formkey = GlobalKey<FormState>();

    return Form(
      key: formkey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.name,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "Name",
                hintText: "Enter your Full Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                hintText: "Enter your Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: controller.phoneno,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.call),
                labelText: "Phone no",
                hintText: "Enter your Contact Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: controller.address,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.location_on),
                labelText: "Address",
                hintText: "Enter your Address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
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
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 10.0),
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
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: controller.pass,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: "Password",
                hintText: "Enter your Password",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    final email = controller.email.text
                        .trim(); // Get the email from the controller
                    final password = controller.pass.text
                        .trim(); // Get the password from the controller
                    controller.registerUser(email,
                        password); // Pass email and password to the controller
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: tPrimaryColor,
                  foregroundColor: tDarkColor,
                ),
                child: const Text("SIGNUP"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
