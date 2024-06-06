import 'package:get/get.dart';
import 'package:v_express/routes/app_routes.dart';

class LoginController extends GetxController {
  @override
  void onInit() {}
  void loginBtn() {
    Get.toNamed(AppRoutes.homeScreen);
  }

  void onPressSignUp() {
    Get.toNamed(AppRoutes.signupScreen);
  }
}
