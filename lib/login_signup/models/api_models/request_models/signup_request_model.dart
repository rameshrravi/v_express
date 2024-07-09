class SignupRequestModel {
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? email;
  String? password;

  SignupRequestModel(
      {this.firstName,
      this.lastName,
      this.mobileNo,
      this.email,
      this.password});

  SignupRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
