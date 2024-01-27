import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:safar_kar/src/features/authentication/models/user_model.dart';
import 'package:safar_kar/src/repo/auth_repo/auth_repos.dart';
import 'package:safar_kar/src/repo/user_repo/user_repo.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final authrepo = Get.find<AuthenticationRepository>();
  final userrepo = Get.find<UserRepository>();

  Rx<UserModel?> userData = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    // Fetch user data when the controller is initialized
    getUserData();
  }

  Future<void> getUserData() async {
    final email = authrepo.firebaseUser.value?.email;
    if (email != null) {
      final user = await userrepo.getUserDetails(email);
      userData.value = user;
    } else {
      Get.snackbar("Error", "Login to Continue");
    }
  }

  Future<void> updateDOB(String newDOB) async {
    final user = authrepo.firebaseUser.value;
    if (user != null) {
      final userId = user.uid;
      try {
        final userDoc =
            FirebaseFirestore.instance.collection("Users").doc(userId);
        await userDoc.update({'dob': newDOB});
      } catch (e) {
        print('Error updating DOB: $e');
      }
    }
  }
}
