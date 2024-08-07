import 'dart:developer';

import 'package:v_express/app_comman/apis/api_response_model.dart';
import 'package:v_express/login_signup/apis/login_signup_api.dart';
import 'package:v_express/login_signup/models/api_models/request_models/login_request_model.dart';
import 'package:v_express/login_signup/models/api_models/request_models/signup_request_model.dart';

class LoginSignupBL {
  LoginAndSignupAPI loginAndSignupAPI = LoginAndSignupAPI();

  Future<ApiResponseModel> login(String userName, String password) async {
    ApiResponseModel apiResponseModel = ApiResponseModel();

    LoginRequestModel loginRequestModel = LoginRequestModel();
    loginRequestModel.userName = userName;
    loginRequestModel.password = password;
    apiResponseModel = await loginAndSignupAPI.loginAPI(loginRequestModel);

    return apiResponseModel;
  }

  Future<ApiResponseModel> signup(SignupRequestModel signupRequestModel) async {
    ApiResponseModel apiResponseModel = ApiResponseModel();
    apiResponseModel = await loginAndSignupAPI.signup(signupRequestModel);
    return apiResponseModel;
  }
}
