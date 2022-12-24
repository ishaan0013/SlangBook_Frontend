import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:slang_app_user/config/app_config.dart';

Future<void> getAllGenresRepo() async {
  Uri url = Uri.parse(AppConfig.BASE_API_URL + 'get-all-genres');

  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
    } else {
      Fluttertoast.showToast(
          msg: json.decode(response.body)['message'].toString());
    }
  } catch (e) {
    Fluttertoast.showToast(msg: json.decode(e.toString()));
  }
}
