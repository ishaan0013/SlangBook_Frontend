import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slang_app_user/helper/text_styles.dart';
import 'package:slang_app_user/screens/subscription/subscreen_controller.dart';
import 'package:slang_app_user/widgets/custom_rounded_button.dart';
import 'package:slang_app_user/widgets/custom_rounded_outlined_button.dart';
import 'package:slang_app_user/widgets/custom_sub_card.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SubscriptionScreenController());
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Obx(
            () => controller.loading.value || controller.loadingSubs.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.isSubscribed.value
                    ? Center(
                        child: Text(
                          'Already subscribed',
                          style: CustomTextStyles.textStyle24Bold
                              .copyWith(fontSize: 24.sp),
                        ),
                      )
                    : CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  'Choose your plan',
                                  style: CustomTextStyles.textStyle24Bold
                                      .copyWith(fontSize: 24.sp),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  'Subscription allows you to download and view all the books available at slackbook store.\nYou can also start 1 week free trial and after that you will be charged per monthly.\nCancel any time',
                                  style:
                                      CustomTextStyles.textStyle12BOld.copyWith(
                                    fontSize: 12.sp,
                                    color: Colors.black54,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (_, index) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Obx(
                                        () => CustomSubscriptionCard(
                                          price: controller.plans[index].price!,
                                          months: controller
                                              .plans[index].totalMonths!
                                              .toString(),
                                          selected:
                                              controller.selectedPlan.value,
                                          callback: () {
                                            controller.selectedPlan.value =
                                                index;
                                          },
                                          index: index,
                                        ),
                                      ),
                                    ),
                                childCount: controller.plans.length),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 40.h,
                                  child: CustomRoundedOutlinedButton(
                                    text: 'Start free trial',
                                    onPress: () {
                                      controller.onFreeTrialButtonPressed();
                                    },
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                SizedBox(
                                  height: 40.h,
                                  child: CustomRoundedElevatedButton(
                                    text: 'Start Plan',
                                    callback: () {
                                      controller.onStartPlanButtonPressed();
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
