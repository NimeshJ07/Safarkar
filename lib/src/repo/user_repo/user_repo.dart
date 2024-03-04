import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your account has been created!!",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong, Try Again!!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await db.collection("Users").where("E-Mail", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserDOB(String email, String newDOB) async {
    try {
      final userQuery =
          await db.collection("Users").where("E-Mail", isEqualTo: email).get();

      if (userQuery.docs.isNotEmpty) {
        final userId = userQuery.docs.first.id;

        await db
            .collection("Users")
            .doc(userId)
            .update({"D.O.B": newDOB}).then((value) {
          Get.snackbar("Success", "Date of Birth updated successfully",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green);
        }).catchError((error) {
          Get.snackbar("Error", "Failed to update Date of Birth",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              colorText: Colors.red);
        });
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> updateUserProfile(
    String email, {
    required String name,
    required String phoneNumber,
    required String address,
    required String password,
  }) async {
    try {
      final userQuery =
          await db.collection("Users").where("E-Mail", isEqualTo: email).get();

      if (userQuery.docs.isNotEmpty) {
        final userId = userQuery.docs.first.id;

        await db.collection("Users").doc(userId).update({
          "Full-Name": name,
          "Phone-no": phoneNumber,
          "Address": address,
          "Password": password,
        }).then((value) {
          Get.snackbar("Success", "Profile updated successfully",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green);
        }).catchError((error) {
          Get.snackbar("Error", "Failed to update profile",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              colorText: Colors.red);
        });
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
