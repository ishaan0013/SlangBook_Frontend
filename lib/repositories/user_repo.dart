import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:slang_app_user/config/app_config.dart';
import 'package:slang_app_user/models/LoginModel.dart';
import 'package:slang_app_user/models/SignUpModel.dart';
import 'package:slang_app_user/models/UserModel.dart';

Future<SignUpModel?> signupUserModel(UserModel user) async {
  Uri url = Uri.parse(AppConfig.BASE_API_URL + 'create-user');
  try {
    var response = await http.post(
      url,
      body: {
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'phone_no': user.phoneNo,
        'fcm_token': "user.fcmToken"
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      Get.snackbar("title", json.decode(response.body)['message'].toString());
      return SignUpModel.fromJson(json.decode(response.body));
    } else {
      Get.snackbar("error", json.decode(response.body)['message'].toString(),
          backgroundColor: Colors.red.shade200);
    }
  } on Exception catch (e) {
    Get.snackbar("exception", e.toString());
  }
}

Future<LoginModel?> loginUserRepo({email, password}) async {
  Uri url = Uri.parse(AppConfig.BASE_API_URL + 'login-user');
  await Future.delayed(Duration(seconds: 2));
  try {
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: json.decode(response.body)['message'].toString());
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      Fluttertoast.showToast(
        msg: json.decode(response.body)['message'].toString(),
        toastLength: Toast.LENGTH_LONG,
      );
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}
