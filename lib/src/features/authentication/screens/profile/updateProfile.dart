import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:safar_kar/src/constants/colors.dart';
import 'package:safar_kar/src/constants/image_string.dart';
import 'package:safar_kar/src/features/authentication/controllers/profilecontroller.dart';
import 'package:safar_kar/src/features/authentication/models/user_model.dart';

class UpDateProfile extends StatelessWidget {
  UpDateProfile({Key? key}) : super(key: key);

  final RxString birthDateInString = "".obs;

  Future<void> selectDate(BuildContext context) async {
    final datePick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (datePick != null) {
      birthDateInString.value =
          "${datePick.month}/${datePick.day}/${datePick.year}";

      final profileController = Get.find<ProfileController>();
      await profileController.updateDOB(birthDateInString.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          "Edit Profile",
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image(image: AssetImage(tProfile)),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: tPrimaryColor,
                              ),
                              child: const Icon(
                                LineAwesomeIcons.camera,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: userData.fullname,
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
                              initialValue: userData.email,
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
                              initialValue: userData.phoneno,
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
                              initialValue: userData.address,
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
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: GestureDetector(
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_today),
                                    const SizedBox(width: 10.0),
                                    Obx(() {
                                      return Text(
                                        birthDateInString.value,
                                      );
                                    }),
                                  ],
                                ),
                                onTap: () => selectDate(context),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              initialValue: userData.pass,
                              obscureText: true,
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
                                  // Call the updateProfile method here
                                  controller.updateProfile(
                                    name: "Updated Name",
                                    email: "updated@email.com",
                                    phoneNumber: "1234567890",
                                    address: "Updated Address",
                                    password: "newpassword",
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: tPrimaryColor,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  "Edit Profile",
                                  style: TextStyle(color: tDarkColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong!!"),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
