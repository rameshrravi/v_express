import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:v_express/app_comman/apis/api_response_model.dart';
import 'package:v_express/app_comman/apis/base_api.dart';
import 'package:v_express/login_signup/models/api_models/request_models/login_request_model.dart';
import 'package:v_express/login_signup/models/api_models/response_models/login_response_model.dart';

class LoginAndSignupAPI extends BaseAPI {
  @override
  Map<String, String> getApiHeaders(
      bool authorizationRequired, String accessToken) {
    Map<String, String> apiHeader = <String, String>{};
    if (authorizationRequired) {
      apiHeader.addAll({"Authorization": "Bearer $accessToken"});
    }
    apiHeader.addAll({"Content-Type": "application/json"});
    apiHeader.addAll({"Accept": "application/json"});
    //print("DDD" + apiHeader.toString());
    return apiHeader;
  }

  Future<ApiResponseModel> loginAPI(
      LoginRequestModel? loginRequestModel) async {
    Response response;
    ApiResponseModel apiResponseModel = ApiResponseModel();
    Dio dio = Dio();
    LoginResponseModel? loginResponseModel;
    print(jsonEncode(loginRequestModel));
    try {
      // dio.interceptors.add(InterceptorsWrapper(
      //   onError: (DioError e, handler) async {
      //     if (e.response?.statusCode == 401 && !tokenRefreshAttempted) {
      //       tokenRefreshAttempted = true;
      //       CoreAPI coreAPI = CoreAPI();
      //       final newToken = await coreAPI.refreshToken();
      //       dio.options.headers['Authorization'] = 'Bearer $newToken';
      //       return refreshTokenAndRetry(dio, e.response!.requestOptions);
      //     }

      //     return handler.next(e);
      //   },
      // ));

      response = await dio.post(
        '${apiBaseUrl}login.php',
        data: jsonEncode(loginRequestModel),
        options: Options(
            //headers: await getApiHeaders(true, accessToken),
            ),
      );
      if (response.statusCode == 200) {
        loginResponseModel = LoginResponseModel.fromJson(jsonDecode(response.data));
        apiResponseModel.model = loginResponseModel;
        apiResponseModel.responseCode = response.statusCode;
        apiResponseModel.message = '';
      } else {
        apiResponseModel.responseCode = response.statusCode;

        apiResponseModel.message = "";
      }
    } catch (e) {
      apiResponseModel.responseCode = -1;
      apiResponseModel.message = "Error:$e";
    } finally {}

    return apiResponseModel;
  }
}
