// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/constants/image_string.dart';
import 'package:safar_kar/src/features/authentication/screens/profile/profile.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title:
            Text("SafarKar", style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () {
                  Get.to(Profile());
                },
                icon: const Image(image: AssetImage(tProfile))),
          )
        ],
      ),
    );
  }
}
