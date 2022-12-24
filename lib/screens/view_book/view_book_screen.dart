import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slang_app_user/config/app_config.dart';
import 'package:slang_app_user/helper/helper.dart';
import 'package:slang_app_user/helper/text_styles.dart';
import 'package:slang_app_user/models/BookModel.dart';
import 'package:slang_app_user/screens/view_book/view_bookcontroller.dart';
import 'package:slang_app_user/widgets/custom_rounded_button.dart';

class ViewBookScreen extends StatelessWidget {
  static const id = '/ViewBookScreen';

  const ViewBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookModel args = Get.arguments;
    final controller = Get.put(ViewBookController());
    return Scaffold(
      body: Obx(
        () => controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 480.h,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(32),
                                  bottomRight: Radius.circular(32),
                                ),
                                child: ImageFiltered(
                                  imageFilter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Image.network(
                                    AppConfig.BASE_URL + args.bookPreviewUrl!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 40.h,
                                left: 16,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Icon(Icons.arrow_back_ios,
                                      color: Colors.white),
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.only(
                                        left: 6, top: 8, bottom: 8),
                                    primary: Colors.blue, // <-- Button color
                                    onPrimary: Colors.red, // <-- Splash color
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 100.h,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: SizedBox(
                                        width: 144.w,
                                        height: 224.h,
                                        child: Image.network(
                                          AppConfig.BASE_URL +
                                              args.bookPreviewUrl!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      args.name!,
                                      style: CustomTextStyles.textStyle24Bold
                                          .copyWith(
                                              fontSize: 24.sp,
                                              color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      args.author!,
                                      style: CustomTextStyles
                                          .textStyle16SemiBold
                                          .copyWith(
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Short Description',
                                style: CustomTextStyles.textStyle24Bold
                                    .copyWith(
                                        fontSize: 24.sp, letterSpacing: .4),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                Helper.lol,
                                style: CustomTextStyles.textStyle14Normal
                                    .copyWith(
                                        fontSize: 14.sp, letterSpacing: .4),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: SizedBox(
                      height: 56.h,
                      width: 120.w,
                      child: CustomRoundedElevatedButton(
                        text: 'Read Book',
                        callback: () {
                          controller.onReadBookButtonPressed(args);
                        },
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
