import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:v_express/login_signup/controller/Login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
