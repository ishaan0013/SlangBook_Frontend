import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/text_styles.dart';

class CustomSearchCard extends StatelessWidget {
  const CustomSearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhysicalModel(
            elevation: 10,
            color: Colors.black12,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: Container(
                width: 156.w,
                height: 175.h,
                child: Image.network(
                  'https://images.unsplash.com/photo-1648494691324-5b01bd861d43?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Heart of hell',
                  style: CustomTextStyles.textStyle20Bold
                      .copyWith(fontSize: 20.sp),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Mitch wizz',
                  style: CustomTextStyles.textStyle12Light
                      .copyWith(fontSize: 12.sp),
                ),
                SizedBox(height: 15.h),
                RatingBarIndicator(
                  rating: 2.75,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 18.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(height: 10.h),
                Text(
                  'asdbjkasbfjk bd fsdfdsf  sdfsd fdsfsdfsdjfjnskdbfkj ajkbfjk bdsjkbfjskdb jskd bfjsdjk bbfjk sjb jdbsfb sdb',
                  style: CustomTextStyles.textStyle10Light
                      .copyWith(fontSize: 10.sp),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
