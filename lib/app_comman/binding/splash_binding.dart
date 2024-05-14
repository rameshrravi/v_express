import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:v_express/app_comman/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
