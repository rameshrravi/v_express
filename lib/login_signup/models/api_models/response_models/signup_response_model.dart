class SignupResponseModel {
  bool? success;
  String? response;

  SignupResponseModel({this.success, this.response});

  SignupResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['response'] = this.response;
    return data;
  }
}