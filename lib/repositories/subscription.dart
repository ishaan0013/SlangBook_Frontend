import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:slang_app_user/config/app_config.dart';
import 'package:slang_app_user/models/free_trial_model.dart';

Future<FreeTrialModel?> checkIfSubscribeToPlanRepo(String token) async {
  await Future.delayed(Duration(seconds: 4));
  Uri url = Uri.parse(AppConfig.BASE_API_URL + 'check -if-subscribe-to-plan');
  try {
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return FreeTrialModel(json.decode(response.body)['message'], true);
    } else {
      return FreeTrialModel(json.decode(response.body)['message'], false);
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
  return null;
}

Future<FreeTrialModel?> subscribeToPlan({planId, token}) async {
  Uri url = Uri.parse(AppConfig.BASE_API_URL + 'subscribe-to-plan');
  try {
    var response = await http.post(
      url,
      body: {
        'plan_id': planId.toString(),
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 201) {
      return FreeTrialModel(json.decode(response.body)['message'], true);
    } else {
      return FreeTrialModel(json.decode(response.body)['message'], false);
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
  return null;
}
