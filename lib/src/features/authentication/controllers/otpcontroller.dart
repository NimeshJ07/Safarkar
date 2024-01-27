import 'package:get/get.dart';
import 'package:safar_kar/src/features/authentication/screens/Dashboard.dart';
import 'package:safar_kar/src/repo/auth_repo/auth_repos.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  void verifyOtp(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOtp(otp);
    isVerified ? Get.offAll(const DashBoard()) : Get.back();
  }
}
