import 'package:get/get.dart';

class TrackingController extends GetxController {
  // Bus details
  final busNumber = "KA01F1234".obs;
  final busName = "Express Liner".obs;
  final startPoint = "Central Station".obs;
  final endPoint = "Airport Terminal".obs;
  final expectedArrival = "10:45 AM".obs;
  final currentLocation = "Tech Park Stop".obs;
  
  // Track bus status
  final isMoving = true.obs;
  final currentSpeed = "45 km/h".obs;
  final delayStatus = "On Time".obs;
  
  // Route stops with timing
  final routeStops = <RouteStop>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    loadRouteStops();
    // Start location updates
    startLocationUpdates();
  }
  
  void loadRouteStops() {
    routeStops.value = [
      RouteStop(
        name: "Central Station",
        time: "09:00 AM",
        isPassed: true,
      ),
      RouteStop(
        name: "City Mall",
        time: "09:20 AM",
        isPassed: true,
      ),
      RouteStop(
        name: "Tech Park Stop",
        time: "09:45 AM",
        isPassed: false,
        isCurrent: true,
      ),
      RouteStop(
        name: "Metro Junction",
        time: "10:15 AM",
        isPassed: false,
      ),
      RouteStop(
        name: "Highway Plaza",
        time: "10:30 AM",
        isPassed: false,
      ),
      RouteStop(
        name: "Airport Terminal",
        time: "10:45 AM",
        isPassed: false,
      ),
    ];
  }
  
  void startLocationUpdates() {
    // Simulate real-time updates
    Future.delayed(Duration(seconds: 30), () {
      updateBusLocation();
      startLocationUpdates();
    });
  }
  
  void updateBusLocation() {
    // Update bus location logic here
    // This is where you would integrate with your actual tracking system
  }
}


class RouteStop {
  final String name;
  final String time;
  final bool isPassed;
  final bool isCurrent;

  RouteStop({
    required this.name,
    required this.time,
    this.isPassed = false,
    this.isCurrent = false,
  });
}