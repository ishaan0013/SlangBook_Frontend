import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:slang_app_user/config/app_config.dart';
import 'package:slang_app_user/models/BookModel.dart';

Future<List<BookModel>?> getAllBooksRepo() async {
  Uri url = Uri.parse(AppConfig.BASE_API_URL + 'get-all-books');

  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<BookModel> books = [];
      for (Map data in json.decode(response.body)['data']) {
        books.add(BookModel.fromJson(data));
      }
      return books;
    } else {
      Fluttertoast.showToast(
          msg: json.decode(response.body)['message'].toString());
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}
