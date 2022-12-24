import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slang_app_user/helper/strings.dart';
import 'package:slang_app_user/helper/text_styles.dart';
import 'package:slang_app_user/screens/sign_up/sign_up_screen_controller.dart';
import 'package:slang_app_user/widgets/custom_rounded_outlined_button.dart';
import 'package:slang_app_user/widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  static const id = '/SignUpScreen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignupScreenController());
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: controller.key,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  Strings.sign_up,
                  style: CustomTextStyles.textStyle24Bold
                      .copyWith(fontSize: 24.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  hint: Strings.first_and_last_name,
                  controller: controller.nameTED,
                  validate: controller.validateName,
                  save: (v) {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  hint: Strings.email_address,
                  controller: controller.emailTED,
                  validate: controller.validateEmail,
                  save: (v) {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  hint: Strings.mobile_phone,
                  controller: controller.phoneNoTED,
                  validate: controller.validatePhoneNo,
                  save: (v) {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  hint: Strings.password,
                  controller: controller.passwordTED,
                  validate: controller.validatePassword,
                  save: (v) {},
                ),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  height: 56.h,
                  child: CustomRoundedOutlinedButton(
                    text: Strings.sign_up,
                    onPress: () => controller.onSignUpButtonClick(context),
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
