

// bus_list_controller.dart
import 'package:get/get.dart';

class BusListController extends GetxController {
  var busList = <Bus>[].obs;
  var isLoading = true.obs;
  var selectedFilter = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBuses();
  }

  void fetchBuses() {
    // Simulate API call
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1), () {
      busList.value = [
        Bus(
          id: '1',
          busNumber: 'KA01F1234',
          busName: 'Royal Express',
          startPoint: 'Bangalore',
          endPoint: 'Mumbai',
          departureTime: '21:00',
          arrivalTime: '09:00',
          duration: '12h',
          fare: 1200.0,
          availableSeats: 23,
          busType: 'AC Sleeper',
          amenities: ['WiFi', 'USB Charging', 'Blanket', 'Water Bottle'],
        ),
        // Add more bus data here
      ];
      isLoading.value = false;
    });
  }

  void filterBuses(String filter) {
    selectedFilter.value = filter;
    // Implement filter logic here
  }
}

class Bus {
  final String id;
  final String busNumber;
  final String busName;
  final String startPoint;
  final String endPoint;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final double fare;
  final int availableSeats;
  final String busType;  // AC/Non-AC
  final List<String> amenities;

  Bus({
    required this.id,
    required this.busNumber,
    required this.busName,
    required this.startPoint,
    required this.endPoint,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.fare,
    required this.availableSeats,
    required this.busType,
    required this.amenities,
  });
}