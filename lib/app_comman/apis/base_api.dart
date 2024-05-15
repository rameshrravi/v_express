import 'package:dio/dio.dart';

abstract class BaseAPI {
  final String apiBaseUrl = 'https://devapi2.kpostindia.com/v2/';
  // final String apiBaseUrl = 'http://192.168.2.24:8989/v2/';

  final String apiKmailBaseUrl = 'https://kmail5.kpostindia.com/kmail5/v2/';

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
}
