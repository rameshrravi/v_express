class ApiResponseModel<T> {
  int? responseCode;
  String? message;

  T? model;

  ApiResponseModel({this.responseCode, this.message, this.model});
}
