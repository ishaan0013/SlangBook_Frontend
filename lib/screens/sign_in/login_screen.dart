import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slang_app_user/helper/strings.dart';
import 'package:slang_app_user/helper/text_styles.dart';
import 'package:slang_app_user/screens/sign_in/sign_in_screen_controller.dart';

import '../../widgets/custom_rounded_outlined_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const id = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginScreenController());
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                Strings.sign_in,
                style:
                    CustomTextStyles.textStyle24Bold.copyWith(fontSize: 24.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                hint: Strings.email_address,
                validate: controller.validateEmail,
                save: controller.saveEmail,
                controller: controller.emailTED,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                hint: Strings.password,
                validate: controller.validatePassword,
                save: controller.savePassword,
                controller: controller.passwordTED,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: false,
                          onChanged: (v) {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                                width: 1.0, color: Color(0xffcccccc)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      const Text(Strings.stay_logged_in),
                    ],
                  ),
                  const Text(Strings.forgot_your_password)
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 56.h,
                child: CustomRoundedOutlinedButton(
                  text: Strings.sign_in,
                  onPress: () {
                    controller.onLogonButtonClicked(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
