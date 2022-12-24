import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slang_app_user/models/BookModel.dart';
import 'package:slang_app_user/screens/read_book/read_book_screen.dart';

import '../../repositories/free_trial.dart';
import '../../repositories/subscription.dart';

class ViewBookController extends GetxController {
  late SharedPreferences _preferences;
  var loading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _preferences = await SharedPreferences.getInstance();
  }

  void onReadBookButtonPressed(BookModel book) async {
    loading.value = true;
    String token = _preferences.getString('token')!;

    //first we check if user has opted for free trial
    var response = await checkIfFreeTrialOverRepo(token);
    if (response != null) {
      // if yes
      if (response.response) {
        // we will navigate to read book screen
        Get.to(() => ReadBookScreen(book: book));
      }
      //if no
      else {
        //Now we check if user has subscribed to plan
        var responseIfSubs = await checkIfSubscribeToPlanRepo(token);

        if (responseIfSubs != null) {
          //if yes
          if (responseIfSubs.response) {
            Get.to(() => ReadBookScreen(book: book));
          }
          //if user has not subs to any plan
          else {
            Fluttertoast.showToast(msg: responseIfSubs.message);
          }
        } else {
          //if not subscribe
          Fluttertoast.showToast(msg: 'Something went wrong');
        }
      }
    }
    loading.value = false;
  }
}
