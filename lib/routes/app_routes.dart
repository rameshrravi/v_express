// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:v_express/add_bus_timing/binding/addbus_binding.dart';
import 'package:v_express/add_bus_timing/screens/addbus_screen.dart';
import 'package:v_express/app_comman/binding/splash_binding.dart';
import 'package:v_express/app_comman/screens/splash_screen.dart';
import 'package:v_express/find_bus_details/binding/searchbus_binding.dart';
import 'package:v_express/find_bus_details/screens/bus_details.dart';
import 'package:v_express/find_bus_details/screens/search_bus.dart';
import 'package:v_express/home/binding/home_binding.dart';
import 'package:v_express/home/screens/home_screen.dart';
import 'package:v_express/login_signup/binding/login_binding.dart';
import 'package:v_express/login_signup/binding/sign_up_binding.dart';
import 'package:v_express/login_signup/screens/login_screen.dart';
import 'package:v_express/login_signup/screens/signup_screen.dart';

class AppRoutes {
  static String splashscreen = '/splashscreen';
  static String loginscreen = '/loginscreen';
  static String homeScreen = '/HomeScreen';
  static String addbusScreen = '/addbusScreen';
  static String signupScreen = '/signup';
  static String searchBusScreen = '/SearchBusScreen';
  static String busDetails = '/busDetails';
  

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
    GetPage(
      name: signupScreen,
      page: () => SignupScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: searchBusScreen,
      page: () => SearchBusScreen(),
      bindings: [
        SearchBusBinding(),
      ],
    ),
     GetPage(
      name: busDetails,
      page: () => BusDetailsScreen(),
      bindings: [
        
      ],
    ),
  ];
}
