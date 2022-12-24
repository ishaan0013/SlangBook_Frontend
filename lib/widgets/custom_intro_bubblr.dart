import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slang_app_user/widgets/custom_intro_bubble.dart';

class CustomIntroBubbles extends StatelessWidget {
  final int index;

  const CustomIntroBubbles({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIntroBubble(
          number: 0,
          index: index,
        ),
        SizedBox(
          width: 14.w,
        ),
        CustomIntroBubble(
          number: 1,
          index: index,
        ),
        SizedBox(
          width: 14.w,
        ),
        CustomIntroBubble(
          number: 2,
          index: index,
        ),
        SizedBox(
          width: 14.w,
        ),
        CustomIntroBubble(
          number: 3,
          index: index,
        )
      ],
    );
  }
}
