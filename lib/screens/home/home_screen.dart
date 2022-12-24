import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slang_app_user/helper/strings.dart';
import 'package:slang_app_user/helper/text_styles.dart';
import 'package:slang_app_user/screens/home/home_screencontroller.dart';
import 'package:slang_app_user/widgets/custom_top_pick_card.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: controller.loading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : Stack(
                  children: [
                    CustomPaint(
                      painter: MyPaint(context),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 64,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              Strings.our_top_picks,
                              style: CustomTextStyles.textStyle24Bold.copyWith(
                                  fontSize: 24.sp, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          CarouselSlider.builder(
                            itemBuilder: (_, index, i) => CustomTopPickCard(
                              book: controller.books[index],
                            ),
                            itemCount: controller.books.length,
                            options: CarouselOptions(
                                height: 384.h,
                                enlargeCenterPage: true,
                                aspectRatio: 1.0,
                                viewportFraction: .45,
                                reverse: false,
                                enableInfiniteScroll: false,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.scale),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              Strings.best_seller,
                              style: CustomTextStyles.textStyle24Bold.copyWith(
                                  fontSize: 24.sp, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemBuilder: (_, index) => Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: CustomTopPickCard(
                                  book: controller.books[index],
                                ),
                              ),
                              itemCount: controller.books.length,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(left: 20),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              Strings.genres,
                              style: CustomTextStyles.textStyle24Bold.copyWith(
                                  fontSize: 24.sp, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedBox(
                            height: 201.h,
                            child: ListView.builder(
                              itemBuilder: (_, index) => Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Container(
                                  width: 278.w,
                                  height: 201.h,
                                  color: Colors.grey,
                                ),
                              ),
                              itemCount: 10,
                              padding: EdgeInsets.only(left: 20),
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

class MyPaint extends CustomPainter {
  final context;

  MyPaint(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Theme.of(context).primaryColor;

    canvas.drawCircle(
        Offset(MediaQuery.of(context).size.width / 2, 0), 243.r, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
