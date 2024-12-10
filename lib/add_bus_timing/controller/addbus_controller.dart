import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_express/routes/app_routes.dart';

class AddbusController extends GetxController {
  TextEditingController busName = TextEditingController();
  TextEditingController busStartFrom = TextEditingController();
  TextEditingController busEnd = TextEditingController();
  TextEditingController fromTime = TextEditingController();
  TextEditingController toTime = TextEditingController();


  RxList<Map<String, String>> routes = <Map<String, String>>[].obs;
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

  void addRoute() {
    if (busStartFrom.text.isNotEmpty && fromTime.text.isNotEmpty) {
      routes.add({
        'routeName': busStartFrom.text,
        'time': fromTime.text,
      });
      busStartFrom.clear();
      fromTime.clear();
    }
  }

  void removeRoute(int index) {
    routes.removeAt(index);
  }

  

  void saveBusDetails() async {
  final String busName = this.busName.text;
  final String startTime = this.fromTime.text;
  final String endTime = this.toTime.text;

  final Map<String, String> busDetails = {
    'busName': busName,
    'startTime': startTime,
    'endTime': endTime,
  };

  final String apiUrl = 'https://yourapiendpoint.com/saveBusDetails'; // Replace with your actual API endpoint

  
  void saveBusDetails() async {
    final String busName = this.busName.text;
    final String startTime = this.fromTime.text;
    final String endTime = this.toTime.text;
  
    final Map<String, String> busDetails = {
      'busName': busName,
      'startTime': startTime,
      'endTime': endTime,
    };
  
    final String apiUrl = 'https://yourapiendpoint.com/saveBusDetails'; // Replace with your actual API endpoint
  
    // try {
    //   Response response = await Dio().post(
    //     apiUrl,
    //     options: Options(headers: {'Content-Type': 'application/json'}),
    //     data: busDetails,
    //   );
  
    //   if (response.statusCode == 200) {
    //     print('Bus Details Saved Successfully');
    //   } else {
    //     print('Failed to save bus details: ${response.statusCode}');
    //   }
    // } catch (e) {
    //   print('Error occurred while saving bus details: $e');
    // }
  }
}
}
