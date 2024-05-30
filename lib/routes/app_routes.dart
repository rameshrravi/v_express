// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:v_express/addbusand_timing/binding/addbus_binding.dart';
import 'package:v_express/addbusand_timing/screens/addbus_screen.dart';
import 'package:v_express/app_comman/binding/splash_binding.dart';
import 'package:v_express/app_comman/screens/splash_screen.dart';
import 'package:v_express/home/binding/home_binding.dart';
import 'package:v_express/home/screens/home_screen.dart';
import 'package:v_express/login/binding/login_binding.dart';
import 'package:v_express/login/screens/login_screen.dart';

class AppRoutes {
  static String splashscreen = '/splashscreen';
  static String loginscreen = '/loginscreen';
  static String homeScreen = '/HomeScreen';
  static String addbusScreen = '/addbusScreen';

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
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: addbusScreen,
      page: () => AddbusScreen(),
      bindings: [
        AddBusBinding(),
      ],
    ),
  ];
}
