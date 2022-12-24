import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slang_app_user/screens/bottom_nav_screen.dart';
import 'package:slang_app_user/screens/home/home_screen.dart';
import 'package:slang_app_user/screens/intro/intro_screen.dart';
import 'package:slang_app_user/screens/login_signup/signup_login_screen.dart';
import 'package:slang_app_user/screens/sign_in/login_screen.dart';
import 'package:slang_app_user/screens/sign_up/sign_up_screen.dart';
import 'package:slang_app_user/screens/test.dart';
import 'package:slang_app_user/screens/view_book/view_book_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: (const Size(375, 812)),
      builder: () => GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xff5ABD8C),
          secondaryHeaderColor: const Color(0xffAFDFC7),
        ),
        debugShowCheckedModeBanner: false,
        // home: Testt(),
        initialRoute: IntroScreen.id,
        getPages: [
          GetPage(name: SignupLoginScreen.id, page: () => SignupLoginScreen()),
          GetPage(name: IntroScreen.id, page: () => IntroScreen()),
          GetPage(name: SignUpScreen.id, page: () => SignUpScreen()),
          GetPage(name: LoginScreen.id, page: () => LoginScreen()),
          GetPage(name: BottomNavScreen.id, page: () => BottomNavScreen()),
          GetPage(name: HomeScreen.id, page: () => HomeScreen()),
          GetPage(name: ViewBookScreen.id, page: () => ViewBookScreen()),
        ],
      ),
    );
  }
}
