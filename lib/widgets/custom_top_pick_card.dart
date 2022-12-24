import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slang_app_user/config/app_config.dart';
import 'package:slang_app_user/helper/text_styles.dart';
import 'package:slang_app_user/models/BookModel.dart';
import 'package:slang_app_user/screens/view_book/view_book_screen.dart';

class CustomTopPickCard extends StatelessWidget {
  final BookModel book;

  const CustomTopPickCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(ViewBookScreen.id, arguments: book);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            AppConfig.BASE_URL + book.bookPreviewUrl!,
            width: 127,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            book.name!,
            style:
                CustomTextStyles.textStyle16SemiBold.copyWith(fontSize: 16.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            book.author!,
            style: CustomTextStyles.textStyle13Light.copyWith(
              fontSize: 13.sp,
              color: const Color(0xff918F92),
            ),
          ),
        ],
      ),
    );
  }
}
