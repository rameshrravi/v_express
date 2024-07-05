import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_express/routes/app_routes.dart';

class SearchbusController extends GetxController {
  TextEditingController busName = TextEditingController();
  TextEditingController busStartFrom = TextEditingController();
  TextEditingController busEnd = TextEditingController();
  TextEditingController fromTime = TextEditingController();
  TextEditingController toTime = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {}
  void loginBtn() {
    Get.toNamed(AppRoutes.homeScreen);
  }

  Future<void> showTimepickerMethod(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      selectedTime = pickedTime;
      toTime.text = selectedTime.format(context);
    }
    update();
  }

  Future<void> showTimepickerFrom(BuildContext context, int index) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      selectedTime = pickedTime;
      if (index == 1) {
        toTime.text = selectedTime.format(context);
      } else if (index == 0) {
        fromTime.text = selectedTime.format(context);
      }
    }
    update();
  }
}
