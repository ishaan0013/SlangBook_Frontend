import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slang_app_user/repositories/user_repo.dart';
import 'package:slang_app_user/screens/bottom_nav_screen.dart';

class LoginScreenController extends GetxController {
  late SharedPreferences _preferences;

  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController emailTED = TextEditingController();
  TextEditingController passwordTED = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _preferences = await SharedPreferences.getInstance();
  }

  String? validateEmail(String v) {
    if (v.isEmpty) {
      return 'This field is required';
    }
    if (!v.isEmail) {
      return 'Please enter valid email address';
    }
    return null;
  }

  String? validatePassword(String v) {
    if (v.isEmpty) {
      return 'This field is required';
    }
    if (v.length < 6) {
      return 'Minimum 6 digit required';
    }
    return null;
  }

  void saveEmail(String v) {
    emailTED.text = v;
  }

  void savePassword(String v) {
    passwordTED.text = v;
  }

  void onLogonButtonClicked(BuildContext context) async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      Get.defaultDialog(
        title: 'Loading',
        content: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      );
      var response =
          await loginUserRepo(email: emailTED.text, password: passwordTED.text);
      if (response != null) {
        _preferences.setString('token', response.token!);
        _preferences.setString('name', response.data!.name!);
        _preferences.setString('email', response.data!.email!);
        _preferences.setString('phone_no', response.data!.phoneNo!);
        Get.back();
        await Future.delayed(Duration(milliseconds: 400));
        Get.toNamed(BottomNavScreen.id);
      } else {
        Get.back();
      }
    }
  }
}
