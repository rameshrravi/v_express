import 'package:get/get.dart';
import 'package:v_express/add_bus_timing/controller/addbus_controller.dart';

class AddBusBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddbusController());
  }
}
