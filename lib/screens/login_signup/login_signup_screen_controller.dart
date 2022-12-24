import 'package:get/get.dart';
import 'package:slang_app_user/screens/sign_in/login_screen.dart';
import 'package:slang_app_user/screens/sign_up/sign_up_screen.dart';

class LoginSignupScreenController extends GetxController {
  void onLoginButtonPressed() {
    Get.toNamed(LoginScreen.id);
  }

  void onSignupButtonPressed() {
    Get.toNamed(SignUpScreen.id);
  }
}
