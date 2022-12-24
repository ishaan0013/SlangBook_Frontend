import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:slang_app_user/config/app_config.dart';
import 'package:slang_app_user/models/PlanModel.dart';

Future<List<PlanModel>?> getAllPlansRepo() async {
  Uri url = Uri.parse(AppConfig.BASE_API_URL + 'get-all-plans');

  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<PlanModel> plans = [];
      for (Map data in json.decode(response.body)['data']) {
        plans.add(PlanModel.fromJson(data));
      }
      return plans;
    } else {
      Fluttertoast.showToast(msg: json.decode(response.body)['message']);
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
  return null;
}
