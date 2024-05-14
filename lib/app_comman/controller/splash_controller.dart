import 'dart:async';

import 'package:get/get.dart';
import 'package:v_express/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.loginscreen);
    });
  }
}
