import 'package:epub_view/epub_view.dart';
import 'package:get/get.dart';
import 'package:internet_file/internet_file.dart';
import 'package:slang_app_user/config/app_config.dart';
import 'package:slang_app_user/models/BookModel.dart';

class ReadBookController extends GetxController{
  late EpubController epubController;

  final BookModel book;
  ReadBookController(this.book);

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    print('bluhhh');
    print(book.name);
    // epubController = EpubController(
    //   // Load document
    //   document: EpubDocument.openData(
    //       await InternetFile.get(AppConfig.BASE_URL + book.bookUrl!),
    // ),
    // // Set start point
    // epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
    // );
  }

}
