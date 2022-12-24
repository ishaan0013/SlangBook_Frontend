import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slang_app_user/models/UserModel.dart';
import 'package:slang_app_user/repositories/user_repo.dart';
import 'package:slang_app_user/screens/home/home_screen.dart';

class SignupScreenController extends GetxController {
  late SharedPreferences _preferences;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController nameTED = TextEditingController();
  TextEditingController emailTED = TextEditingController();
  TextEditingController passwordTED = TextEditingController();
  TextEditingController phoneNoTED = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _preferences = await SharedPreferences.getInstance();
  }

  String? validateName(String v) {
    if (v.isEmpty) {
      return 'This field is required';
    }
    return null;
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

  String? validatePhoneNo(String v) {
    if (v.isEmpty) {
      return 'This field is required';
    }
    if (!v.isPhoneNumber) {
      return 'Please enter valid phone no';
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

  void saveName(String v) {
    nameTED.text = v;
  }

  void saveEmail(String v) {
    emailTED.text = v;
  }

  void savePhoneNo(String v) {
    phoneNoTED.text = v;
  }

  void savePassword(String v) {
    passwordTED.text = v;
  }

  void onSignUpButtonClick(BuildContext context) async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      UserModel user = UserModel();
      user.name = nameTED.text;
      user.email = emailTED.text;
      user.phoneNo = phoneNoTED.text;
      user.password = passwordTED.text;
      Get.defaultDialog(
        title: 'Loading',
        content: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      );
      await Future.delayed(Duration(seconds: 4));
      var response = await signupUserModel(user);
      if (response != null) {
        _preferences.setString('token', response.token!);
        _preferences.setString('name', response.data!.name!);
        _preferences.setString('email', response.data!.email!);
        _preferences.setString('phone_no', response.data!.phoneNo!);
        Get.back();
        await Future.delayed(Duration(milliseconds: 400));
        Get.toNamed(HomeScreen.id);
      }
    }
  }
}
