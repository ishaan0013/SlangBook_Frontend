import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slang_app_user/models/BookModel.dart';
import 'package:slang_app_user/repositories/books_repo.dart';

class HomeScreenController extends GetxController {
  late SharedPreferences _preferences;
  RxList<BookModel> books = RxList<BookModel>();
  var loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllBooks();
  }

  void getAllBooks() async {
    loading.value = true;
    var response = await getAllBooksRepo();
    if (response != null) {
      print('ffff');
      books.value = response;
      loading.value = false;
    }
  }
}
