import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_express/find_bus_details/screens/bus_details.dart';
import 'package:v_express/routes/app_routes.dart';

class SearchbusController extends GetxController {
  TextEditingController districtController = TextEditingController();
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  RxString district = ''.obs;
  RxString source = ''.obs;
  RxString destination = ''.obs;

  RxList<Map<String, dynamic>> busList = <Map<String, dynamic>>[
    {
      'name': 'Bus A',
      'district': 'Chennai',
      'source': 'Place A',
      'destination': 'Place B',
      'time': '10:00 AM',
      'routes': ['Stop 1', 'Stop 2', 'Stop 3']
    },
    {
      'name': 'Bus B',
      'district': 'Coimbatore',
      'source': 'Place C',
      'destination': 'Place D',
      'time': '11:00 AM',
      'routes': ['Stop 4', 'Stop 5', 'Stop 6']
    },
    // Add more bus details as needed
  ].obs;

  RxList<Map<String, dynamic>> filteredBusList = <Map<String, dynamic>>[].obs;

  RxMap<String, dynamic> selectedBus = RxMap<String, dynamic>();

  @override
  void onInit() {
    super.onInit();
    everAll([district, source, destination], (_) => filterBusList());
  }

  void filterBusList() {
    filteredBusList.value = busList.where((bus) {
      final matchesDistrict = district.value.isEmpty || bus['district']!.toLowerCase().contains(district.value.toLowerCase());
      final matchesSource = source.value.isEmpty || bus['source']!.toLowerCase().contains(source.value.toLowerCase());
      final matchesDestination = destination.value.isEmpty || bus['destination']!.toLowerCase().contains(destination.value.toLowerCase());
      return matchesDistrict && matchesSource && matchesDestination;
    }).toList();
  }

  void selectBus(Map<String, dynamic> bus) {
    selectedBus.value = bus;
  }

  void loginBtn() {
    Get.to(BusDetailsScreen());
  }
}