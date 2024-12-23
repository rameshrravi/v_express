import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_express/routes/app_routes.dart';

class AddbusController extends GetxController {
  final locationList = [
    'Ariyalur', 'Chennai', 'Coimbatore', 'Cuddalore', 'Dharmapuri', 
    'Dindigul', 'Erode', 'Kallakurichi', 'Kanchipuram', 'Kanyakumari', 
    'Karur', 'Krishnagiri', 'Madurai', 'Nagapattinam', 'Namakkal', 
    'Nilgiris', 'Perambalur', 'Pudukkottai', 'Ramanathapuram', 'Salem', 
    'Sivaganga', 'Thanjavur', 'Theni', 'Thoothukudi', 'Tiruchirappalli', 
    'Tirunelveli', 'Tiruppur', 'Tiruvallur', 'Tiruvannamalai', 'Tiruvarur', 
    'Vellore', 'Viluppuram', 'Virudhunagar'
  ].obs;
  
  final selectedLocation = ''.obs;
  final busNameController = TextEditingController();
  
  final startLocationController = TextEditingController();
  final endLocationController = TextEditingController();
  final startDate = DateTime.now().obs;
  final startTime = TimeOfDay.now().obs;
  final endDate = DateTime.now().obs;
  final endTime = TimeOfDay.now().obs;
  
  final routes = <RouteInfo>[].obs;
  final formKey = GlobalKey<FormState>();
  
  void addNewRoute() {
    routes.add(RouteInfo(
      routeName: '',
      time: TimeOfDay.now(),
    ));
  }
  
  void removeRoute(int index) {
    routes.removeAt(index);
  }
  
  bool validateForm() {
    if (formKey.currentState?.validate() ?? false) {
      if (selectedLocation.value.isEmpty) {
        Get.snackbar('Error', 'Please select a location');
        return false;
      }
      if (startLocationController.text.isEmpty) {
        Get.snackbar('Error', 'Please enter start location');
        return false;
      }
      if (endLocationController.text.isEmpty) {
        Get.snackbar('Error', 'Please enter end location');
        return false;
      }
      if (routes.isEmpty) {
        Get.snackbar('Error', 'Please add at least one route');
        return false;
      }
      return true;
    }
    return false;
  }
  
  void saveRouteDetails() {
    if (validateForm()) {
      final data = {
        'location': selectedLocation.value,
        'busName': busNameController.text,
        'startLocation': startLocationController.text,
        'endLocation': endLocationController.text,
        'startDateTime': DateTime(
          startDate.value.year,
          startDate.value.month,
          startDate.value.day,
          startTime.value.hour,
          startTime.value.minute,
        ).toIso8601String(),
        'endDateTime': DateTime(
          endDate.value.year,
          endDate.value.month,
          endDate.value.day,
          endTime.value.hour,
          endTime.value.minute,
        ).toIso8601String(),
        'routes': routes.map((route) => {
          'routeName': route.routeName,
          'time': '${route.time.hour}:${route.time.minute}',
        }).toList(),
      };
      
      print('Sending data to server: $data');
      Get.snackbar('Success', 'Route details saved successfully');
    }
  }
}

class RouteInfo {
  String routeName;
  TimeOfDay time;
  
  RouteInfo({
    required this.routeName,
    required this.time,
  });
}
