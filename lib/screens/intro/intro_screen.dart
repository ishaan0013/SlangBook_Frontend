import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slang_app_user/helper/strings.dart';
import 'package:slang_app_user/models/intro_model.dart';
import 'package:slang_app_user/screens/intro/intro_screen_controller.dart';
import 'package:slang_app_user/screens/login_signup/signup_login_screen.dart';
import 'package:slang_app_user/widgets/custom_intro_bubblr.dart';

import '../../widgets/custom_intro_slide.dart';

class IntroScreen extends StatelessWidget {
  static const id = '/';

  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(IntroScreenController());
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => controller.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView.builder(
                      itemBuilder: (_, index) {
                        List<IntroModel> intros = [
                          IntroModel(
                              Strings.discounted_second_hand,
                              Strings.used_and_near_new_secondhand,
                              'assets/first.svg'),
                          IntroModel(
                              Strings.book_grocers_nationally,
                              Strings.we_have_successfully_opened,
                              'assets/second.svg'),
                          IntroModel(
                              Strings.sell_or_recycle_your_old_books,
                              Strings.if_you_are_looking_to_downsize_sell,
                              'assets/third.svg'),
                        ];
                        return index == 3
                            // || controller.currentIndex.value == 3
                            ? const SignupLoginScreen()
                            : Center(
                                child: CustomIntroSlide(
                                intro: intros[index],
                              ));
                      },
                      itemCount: 4,
                      allowImplicitScrolling: true,
                      physics: const BouncingScrollPhysics(),
                      scrollBehavior: const CupertinoScrollBehavior(),
                      onPageChanged: (i) {
                        controller.currentIndex.value = i;
                        if (controller.currentIndex.value == 3) {
                          controller.isCompleteIntroSlide();
                        }
                      },
                    ),
                    Align(
                      alignment: const Alignment(0, 0.8),
                      child: CustomIntroBubbles(
                        index: controller.currentIndex.value,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
