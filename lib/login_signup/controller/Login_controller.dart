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
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {}
  Future<void> loginBtn() async {
      Get.offAllNamed(AppRoutes.homeScreen);
   
    // apiResponseModel = await loginSignupBL.login(
    //     mobileNoController.text, passwordController.text);
    // if (apiResponseModel.responseCode == 200) {
    //   loginResponseModel = apiResponseModel.model as LoginResponseModel;
    //   Get.offAllNamed(AppRoutes.homeScreen);
    // }else{
    //   showSnackbar(apiResponseModel.message!);
    // }
  }

  void onPressLogin() async {
    bool validateMobileNo() =>
        mobileNoController.text.isNotEmpty &&
        mobileNoController.text.length == 10;
    bool validateEmail() => RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(mobileNoController.text);
    bool validatePassword() => passwordController.text.length >= 6;

    if (!mobileNoController.text.isNotEmpty) {
      showSnackbar("Enter Mobile Number or Email");
      // All validation pass
    } else if (!validatePassword()) {
      showSnackbar("Enter Password");
    } else {
      loginBtn();
    }
  }

  void onPressSignUp() {
    Get.toNamed(AppRoutes.signupScreen);
  }

  void showSnackbar(String txtmessage) {
    Get.showSnackbar(GetSnackBar(
      message: txtmessage,
      duration: const Duration(seconds: 2),
    ));
  }
}
