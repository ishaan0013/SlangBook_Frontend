import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slang_app_user/helper/text_styles.dart';
import 'package:slang_app_user/models/intro_model.dart';

class CustomIntroSlide extends StatelessWidget {
  final IntroModel intro;

  const CustomIntroSlide({Key? key, required this.intro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // SizedBox(height: 78.h),
          Text(
            intro.heading,
            style: CustomTextStyles.textStyle30Normal.copyWith(
                color: Theme.of(context).primaryColor, fontSize: 30.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            intro.text,
            style: CustomTextStyles.textStyle14Normal.copyWith(
              color: Theme.of(context).secondaryHeaderColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 134.h),
          Hero(tag: intro.imUrl, child: SvgPicture.asset(intro.imUrl)),
          SizedBox(height: 106.h),
        ],
      ),
    );
  }
}
