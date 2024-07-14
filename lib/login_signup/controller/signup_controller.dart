import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert' show json;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:v_express/app_comman/apis/api_response_model.dart';
import 'package:v_express/login_signup/buisness_rulse/login_signup_bl.dart';
import 'package:v_express/login_signup/controller/auth_repo.dart';
import 'package:v_express/login_signup/models/api_models/request_models/signup_request_model.dart';
import 'package:v_express/routes/app_routes.dart';

class SignupController extends GetxController {
  User? user;
  final AuthRepo _repo = AuthRepo();
  bool isLodingState = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;
  LoginSignupBL loginSignupBL = LoginSignupBL();
  handleGoogleSignin() async {
    isLodingState = true;
    update();
    try {
      user = await _repo.signInWithGoogle();
      isLodingState = false;
      update();
    } catch (e) {
      print(e.toString());
      Get.showSnackbar(GetSnackBar(
        title: "Google sign in failed",
        message: e.toString(),
      ));
    }
  }

  handleGoogleSignOut() async {
    isLodingState = true;
    update();
    await _repo.signOutGoogleAccount();
    user = null;
    isLodingState = false;
    update();
  }

  Future<void> onTapSignup() async {
    bool validateFirstName() => firstNameController.text.isNotEmpty;
    bool validateLastName() => lastNameController.text.isNotEmpty;
    bool validateMobileNo() =>
        mobileNoController.text.isNotEmpty &&
        mobileNoController.text.length == 10;
    bool validateEmail() => RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    bool validatePassword() => passwordController.text.length >= 6;
    bool validateConfrimPassword() =>
        confirmPasswordController.text.length >= 6;
    bool comparePasswordConfirmPassword() =>
        passwordController.text == confirmPasswordController.text;

    if (!validateFirstName()) {
      showSnackbar("Enter FirstName");
      // All validation pass
    } else if (!validateLastName()) {
      showSnackbar("Enter LastName");
    } else if (!validateEmail()) {
      showSnackbar("Enter Email");
    } else if (!validateMobileNo()) {
      showSnackbar("Enter MobileNo at least 10 character");
    } else if (!validatePassword()) {
      showSnackbar("Enter Password at least 6 character");
    } else if (!validateConfrimPassword()) {
      showSnackbar("Enter Confirm-Password at least 6 character");
    } else if (!comparePasswordConfirmPassword()) {
      showSnackbar("Password does not match");
    } else {
      SignupRequestModel signupRequestModel = SignupRequestModel();
      signupRequestModel.firstName = firstNameController.text;
      signupRequestModel.lastName = lastNameController.text;
      signupRequestModel.email = emailController.text;
      signupRequestModel.mobileNo = mobileNoController.text;
      signupRequestModel.password = passwordController.text;
      ApiResponseModel apiResponseModel =
          await loginSignupBL.signup(signupRequestModel);

      if (apiResponseModel.responseCode == 200) {
        showSnackbar(apiResponseModel.message!);
        Get.offAllNamed(AppRoutes.loginscreen);
      } else {
        showSnackbar(apiResponseModel.message!);
      }
    }
  }

  void showSnackbar(String txtmessage) {
    Get.showSnackbar(GetSnackBar(
      message: txtmessage,
      duration: const Duration(seconds: 2),
    ));
  }

  obx(Icon Function(dynamic state) param0) {}
}
