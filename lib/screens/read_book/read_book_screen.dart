import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:slang_app_user/config/app_config.dart';
import 'package:slang_app_user/models/BookModel.dart';

class ReadBookScreen extends StatefulWidget {
  final BookModel book;

  const ReadBookScreen({Key? key, required this.book}) : super(key: key);

  @override
  State<ReadBookScreen> createState() => _ReadBookScreenState();
}

class _ReadBookScreenState extends State<ReadBookScreen> {
  late EpubController _epubController;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    inittt();
  }

  Future<void> inittt() async {
    _epubController = EpubController(
      // Load document
      document: EpubDocument.openData(
        await InternetFile.get(AppConfig.BASE_URL + widget.book.bookUrl!)
            .then((v) {
          setState(() {
            loading = false;
          });

          return v;
        }),
      ),
      // Set start point
      epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              // Show actual chapter name
              title: EpubViewActualChapter(
                  controller: _epubController,
                  builder: (chapterValue) => Text(
                        'Chapter: ' +
                            (chapterValue?.chapter?.Title
                                    ?.replaceAll('\n', '')
                                    .trim() ??
                                ''),
                        textAlign: TextAlign.start,
                      )),
            ),
            // Show table of contents
            drawer: Drawer(
              child: EpubViewTableOfContents(
                controller: _epubController,
              ),
            ),
            // Show epub document
            body: EpubView(
              controller: _epubController,
            ),
          );
  }
}
