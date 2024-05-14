// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:v_express/app_comman/binding/splash_binding.dart';
import 'package:v_express/app_comman/screens/splash_screen.dart';
import 'package:v_express/login/screens/login_screen.dart';

class AppRoutes {
  static String splashscreen = '/splashscreen';
  static String loginscreen = '/loginscreen';

  static List<GetPage> pages = [
    GetPage(
      name: splashscreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: loginscreen,
      page: () => LoginScreen(),
      bindings: const [],
    ),
  ];
}
