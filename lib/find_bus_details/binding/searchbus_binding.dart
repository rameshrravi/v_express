import 'package:get/get.dart';
import 'package:v_express/add_bus_timing/controller/addbus_controller.dart';
import 'package:v_express/find_bus_details/controller/search_bus_controller.dart';

class SearchBusBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchbusController());

    
  }
}
