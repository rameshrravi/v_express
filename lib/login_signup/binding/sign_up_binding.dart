import 'package:get/get.dart';
import 'package:v_express/login_signup/controller/signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}
