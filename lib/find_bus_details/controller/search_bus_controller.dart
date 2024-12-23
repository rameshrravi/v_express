import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_express/find_bus_details/screens/bus_details.dart';
import 'package:v_express/routes/app_routes.dart';


class SearchbusController extends GetxController {
 final districtSearchController = TextEditingController();
  final startPointSearchController = TextEditingController();
  final endPointSearchController = TextEditingController();

  // Observable lists for all data
  final districts = [
    'Mumbai District',
    'Delhi District',
    'Bangalore Urban',
    'Chennai District',
    'Hyderabad District',
    'Kolkata District'
  ].obs;

  final startPoints = [
    'Central Station',
    'Airport Terminal',
    'City Center Bus Stop',
    'Metro Station',
    'Mall Terminal',
    'Highway Junction'
  ].obs;

  final endPoints = [
    'Beach Road Terminal',
    'Hill Station Stop',
    'Market Complex',
    'University Gate',
    'Industrial Area',
    'Tech Park'
  ].obs;

  // Observable lists for filtered results
  final filteredDistricts = <String>[].obs;
  final filteredStartPoints = <String>[].obs;
  final filteredEndPoints = <String>[].obs;

  // Selected values
  final selectedDistrict = RxString('');
  final selectedStartPoint = RxString('');
  final selectedEndPoint = RxString('');

  // Visibility flags for dropdowns
  final isDistrictDropdownVisible = false.obs;
  final isStartPointDropdownVisible = false.obs;
  final isEndPointDropdownVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize filtered lists with all items
    filteredDistricts.assignAll(districts);
    filteredStartPoints.assignAll(startPoints);
    filteredEndPoints.assignAll(endPoints);

    // Add listeners to text controllers
    setupSearchListeners();
  }

  void setupSearchListeners() {
    districtSearchController.addListener(() {
      filterDistricts(districtSearchController.text);
    });

    startPointSearchController.addListener(() {
      filterStartPoints(startPointSearchController.text);
    });

    endPointSearchController.addListener(() {
      filterEndPoints(endPointSearchController.text);
    });
  }

  void filterDistricts(String query) {
    if (query.isEmpty) {
      filteredDistricts.assignAll(districts);
    } else {
      filteredDistricts.assignAll(
        districts.where((district) => 
          district.toLowerCase().contains(query.toLowerCase())
        ).toList()
      );
    }
  }

  void filterStartPoints(String query) {
    if (query.isEmpty) {
      filteredStartPoints.assignAll(startPoints);
    } else {
      filteredStartPoints.assignAll(
        startPoints.where((point) => 
          point.toLowerCase().contains(query.toLowerCase())
        ).toList()
      );
    }
  }

  void filterEndPoints(String query) {
    if (query.isEmpty) {
      filteredEndPoints.assignAll(endPoints);
    } else {
      filteredEndPoints.assignAll(
        endPoints.where((point) => 
          point.toLowerCase().contains(query.toLowerCase())
        ).toList()
      );
    }
  }

  void clearAll() {
    districtSearchController.clear();
    startPointSearchController.clear();
    endPointSearchController.clear();
    selectedDistrict.value = '';
    selectedStartPoint.value = '';
    selectedEndPoint.value = '';
    filteredDistricts.assignAll(districts);
    filteredStartPoints.assignAll(startPoints);
    filteredEndPoints.assignAll(endPoints);
  }

  @override
  void dispose() {
    districtSearchController.dispose();
    startPointSearchController.dispose();
    endPointSearchController.dispose();
    super.dispose();
  }
    void onPressSearch() {
    Get.toNamed(AppRoutes.busListScreen);
  }
}