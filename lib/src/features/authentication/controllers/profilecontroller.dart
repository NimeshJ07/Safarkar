import 'package:get/get.dart';
import 'package:safar_kar/src/repo/auth_repo/auth_repos.dart';
import 'package:safar_kar/src/repo/user_repo/user_repo.dart';
import 'package:safar_kar/src/features/authentication/models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final auth = Get.put(AuthenticationRepository());
  final user = Get.put(UserRepository());

  Rx<UserModel?> userData = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    getUserData(); // Load user data on initialization
  }

  Future<void> getUserData() async {
    final email = auth.firebaseUser.value?.email;
    if (email != null) {
      final userDetail = await user.getUserDetails(email);
      if (userDetail != null) {
        userData.value = userDetail;
      } else {
        // Handle the case when user details are not available
        Get.snackbar("Error", "User details not found");
      }
    } else {
      Get.snackbar("Error", "Login to Continue");
    }
  }

  Future<void> updateDOB(String newDOB) async {
    final email = auth.firebaseUser.value?.email;
    if (email != null) {
      await user.updateUserDOB(email, newDOB);
      // Refresh user data after update
      await getUserData();
    } else {
      Get.snackbar("Error", "Login to Continue");
    }
  }

  // Placeholder method for updating the user profile
  Future<void> updateProfile({
    required String name,
    required String email,
    required String phoneNumber,
    required String address,
    required String password,
  }) async {
    final emailValue = auth.firebaseUser.value?.email;
    if (emailValue != null) {
      await user.updateUserProfile(
        emailValue,
        name: name,
        phoneNumber: phoneNumber,
        address: address,
        password: password,
      );
      // Refresh user data after update
      await getUserData();
    } else {
      Get.snackbar("Error", "Login to Continue");
    }
  }
}
