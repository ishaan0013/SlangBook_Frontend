import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slang_app_user/helper/strings.dart';

import '../widgets/custom_search_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: const Color(0xffF9F9F9),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.search),
                    hintText: Strings.search_books_authors),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 30),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) => const CustomSearchCard(),
                  itemCount: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
