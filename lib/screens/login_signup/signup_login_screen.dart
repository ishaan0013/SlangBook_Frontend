import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:slang_app_user/helper/strings.dart';
import 'package:slang_app_user/helper/text_styles.dart';
import 'package:slang_app_user/screens/login_signup/login_signup_screen_controller.dart';
import 'package:slang_app_user/widgets/custom_rounded_button.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class SignupLoginScreen extends StatelessWidget {
  static const id = '/SignupLoginScreen';

  const SignupLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginSignupScreenController());
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/starting.svg',
            fit: BoxFit.cover,
            width: 375.w,
          ),
          Align(
            alignment: Alignment(-1, 1.h),
            // alignment:Alignment(-1,),
            child: SizedBox(
              height: 319.79.h,
              width: 477.77.w,
              child: SvgPicture.asset(
                'assets/path.svg',
                // fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.4),
            child: Container(
              width: double.infinity,
              height: 316.h,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Books For \nEvery Taste.',
                      style: CustomTextStyles.textStyle30Normal.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 98.h,
                    ),
                    SizedBox(
                      height: 56.h,
                      child: CustomRoundedElevatedButton(
                        text: Strings.sign_in,
                        callback: () {
                          controller.onLoginButtonPressed();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 56.h,
                      child: CustomRoundedElevatedButton(
                        text: Strings.sign_up,
                        callback: () {
                          controller.onSignupButtonPressed();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
