import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_express/app_comman/apis/api_response_model.dart';
import 'package:v_express/login_signup/buisness_rulse/login_signup_bl.dart';
import 'package:v_express/login_signup/models/api_models/response_models/login_response_model.dart';
import 'package:v_express/routes/app_routes.dart';

class LoginController extends GetxController {
  ApiResponseModel apiResponseModel = ApiResponseModel();
  LoginSignupBL loginSignupBL = LoginSignupBL();
  LoginResponseModel? loginResponseModel;
  @override
  void onInit() {}
  Future<void> loginBtn() async {
    apiResponseModel = await loginSignupBL.login("9626061922", "123456");

    if (apiResponseModel.responseCode == 200) {
      loginResponseModel = apiResponseModel.model as LoginResponseModel;
      print(loginResponseModel!.firstName);
      Get.toNamed(AppRoutes.homeScreen);
    }
  }

  void onPressSignUp() async {
    Get.toNamed(AppRoutes.signupScreen);
  }
}
