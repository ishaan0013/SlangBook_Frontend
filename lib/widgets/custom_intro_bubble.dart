import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIntroBubble extends StatelessWidget {
  final int index;
  final int number;

  const CustomIntroBubble({Key? key, required this.index, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 7.r,
      backgroundColor: index == number
          ? Theme.of(context).primaryColor
          : Theme.of(context).secondaryHeaderColor,
    );
  }
}
