

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:v_express/profile/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
    void dependencies() {
      Get.put(ProfileController());
  }
}