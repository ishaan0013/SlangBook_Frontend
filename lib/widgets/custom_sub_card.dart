import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/text_styles.dart';

class CustomSubscriptionCard extends StatelessWidget {
  final String price;
  final String months;
  final int selected;
  final VoidCallback callback;
  final int index;

  const CustomSubscriptionCard(
      {Key? key,
      required this.price,
      required this.months,
      required this.selected,
      required this.callback,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value:selected == index? true:false,
      contentPadding: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
      ),
      tileColor: selected == index
          ? Theme.of(context).primaryColor
          : Theme.of(context).secondaryHeaderColor,
      title: RichText(
        text: TextSpan(
          text: '₹ $price ',
          style: CustomTextStyles.textStyle24Bold
              .copyWith(fontSize: 30.sp, color: Colors.white),
          children: [
            TextSpan(
                text: 'for $months month',
                style: CustomTextStyles.textStyle16SemiBold
                    .copyWith(fontSize: 16.sp))
          ],
        ),
      ),
      subtitle: Text('You will charged $price for $months'),
      onChanged: (bool? value) {
        callback.call();
      },
    );
  }
}
