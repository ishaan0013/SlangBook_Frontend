import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';

class Testt extends StatefulWidget {
  const Testt({Key? key}) : super(key: key);

  @override
  State<Testt> createState() => _TesttState();
}

class _TesttState extends State<Testt> {
  void ll() {
    EpubViewer.setConfig(
      themeColor: Theme.of(context).primaryColor,
      identifier: "iosBook",
      scrollDirection: EpubScrollDirection.VERTICAL,
      allowSharing: true,
      enableTts: true,
    );

    /**
     * @bookPath
     * @lastLocation (optional and only android)
     */
    EpubViewer.openAsset(
      'assets/alice.epub', // first page will open up if the value is null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ll();
          },
          child: Text('da'),
        ),
      ),
    );
  }
}
