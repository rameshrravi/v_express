class LoginResponseModel {
  bool? success;
  String? userId;
  String? firstName;
  String? lastName;
  String? mobilNo;
  String? emailId;
  String? response;

  LoginResponseModel(
      {this.success,
      this.userId,
      this.firstName,
      this.lastName,
      this.mobilNo,
      this.emailId,
      this.response});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobilNo = json['mobilNo'];
    emailId = json['emailId'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobilNo'] = this.mobilNo;
    data['emailId'] = this.emailId;
    data['response'] = this.response;
    return data;
  }
}
