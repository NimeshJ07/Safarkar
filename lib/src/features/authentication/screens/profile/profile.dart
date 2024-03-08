import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:safar_kar/src/constants/colors.dart';
import 'package:safar_kar/src/constants/image_string.dart';
import 'package:safar_kar/src/features/authentication/controllers/logincontroller.dart';
import 'package:safar_kar/src/features/authentication/screens/Help/gettingStart.dart';
import 'package:safar_kar/src/features/authentication/screens/Login/login.dart';
import 'package:safar_kar/src/features/authentication/screens/profile/updateProfile.dart';
import 'package:safar_kar/src/repo/auth_repo/auth_repos.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var isIconColor = isDark ? tPrimaryColor : tAccentColor;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
        title:
            Text("Profile", style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
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
                        LineAwesomeIcons.alternate_pencil,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "User-Name",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "User-Email",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(UpDateProfile());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(color: tDarkColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),

              //Menu

              ListTile(
                onTap: () {
                  Get.to(GetStart());
                },
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: isIconColor.withOpacity(0.1)),
                  child: Icon(
                    LineAwesomeIcons.save,
                    color: isIconColor,
                  ),
                ),
                title: Text("Getting Started",
                    style: Theme.of(context).textTheme.labelLarge),
                trailing: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(
                    LineAwesomeIcons.angle_right,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: isIconColor.withOpacity(0.1)),
                  child: Icon(
                    LineAwesomeIcons.question,
                    color: isIconColor,
                  ),
                ),
                title:
                    Text("FAQ", style: Theme.of(context).textTheme.labelLarge),
                trailing: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(
                    LineAwesomeIcons.angle_right,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              ListTile(
                onTap: () {
                  controller.logoutUser();
                },
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: isIconColor.withOpacity(0.1)),
                  child: Icon(
                    LineAwesomeIcons.alternate_sign_out,
                    color: isIconColor,
                  ),
                ),
                title: Text(
                  "Logout ",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
