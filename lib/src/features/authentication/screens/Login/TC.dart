import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/constants/colors.dart';
import 'package:safar_kar/src/constants/image_string.dart';
import 'package:safar_kar/src/constants/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safar_kar/src/features/authentication/screens/Login/Scanner.dart';

class TC extends StatefulWidget {
  const TC({Key? key}) : super(key: key);

  @override
  State<TC> createState() => _TCState();
}

class _TCState extends State<TC> {
  bool _obscureText = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to perform login action
  void _login() async {
    // Validate input fields
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      // Show error message if any field is empty
      Get.snackbar("Error", "Please enter username and password");
      return;
    }

    try {
      // Fetch user document from Firestore
      final userDoc = await _firestore.collection('TC').doc('Checker').get();

      // Check if user exists and credentials match
      if (userDoc.exists) {
        final userData = userDoc.data();
        if (userData != null &&
            userData['Username'] == _usernameController.text &&
            userData['Password'] == _passwordController.text) {
          // Credentials are correct, navigate to next screen or perform necessary actions
          Get.snackbar("Success", "Login Successful",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green);
          Get.off(const Scanner());
          // Navigate to next screen or perform necessary actions
        } else {
          // Show error message if credentials are incorrect
          Get.snackbar("Error", "Invalid username or password",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              colorText: Colors.red);
        }
      } else {
        // Show error message if user does not exist
        Get.snackbar("Error", "User not found",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red);
      }
    } catch (e) {
      // Show error message if sign-in fails
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          // Center widget added here
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage(tTC),
                    ),
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
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: "Username",
                      hintText: "Enter your Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
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
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _login, // Call _login method on button press
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 93, 175, 241),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("LOGIN"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
