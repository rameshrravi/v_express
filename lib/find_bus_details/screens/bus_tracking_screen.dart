import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_express/find_bus_details/controller/bus_tracking_details.dart';

class BusTrackingScreen extends StatelessWidget {
  final controller = Get.put(TrackingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Tracking'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => controller.loadRouteStops(),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildBusInfoCard(),
          Expanded(
            child: _buildRouteTimeline(),
          ),
        ],
      ),
    );
  }

  Widget _buildBusInfoCard() {
    return Obx(() => Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.busName.value,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      controller.busNumber.value,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    controller.delayStatus.value,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoColumn(
                  'Current Location',
                  controller.currentLocation.value,
                  Icons.location_on,
                ),
                _buildInfoColumn(
                  'Speed',
                  controller.currentSpeed.value,
                  Icons.speed,
                ),
                _buildInfoColumn(
                  'Expected Arrival',
                  controller.expectedArrival.value,
                  Icons.access_time,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildInfoColumn(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRouteTimeline() {
    return Obx(() => ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: controller.routeStops.length,
      itemBuilder: (context, index) {
        final stop = controller.routeStops[index];
        return _buildTimelineItem(
          stop,
          isFirst: index == 0,
          isLast: index == controller.routeStops.length - 1,
        );
      },
    ));
  }

  Widget _buildTimelineItem(
    RouteStop stop, {
    bool isFirst = false,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(
              stop.time,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                width: 2,
                height: 24,
                color: isFirst ? Colors.transparent : _getLineColor(stop),
              ),
              _buildTimelineDot(stop),
              Container(
                width: 2,
                height: 24,
                color: isLast ? Colors.transparent : _getLineColor(stop),
              ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: stop.isCurrent ? Colors.blue.shade50 : Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: stop.isCurrent
                    ? Border.all(color: Colors.blue.shade200)
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stop.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: stop.isPassed ? Colors.grey : Colors.black,
                    ),
                  ),
                  if (stop.isCurrent) ...[
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.directions_bus,
                          size: 16,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Bus is here',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineDot(RouteStop stop) {
    if (stop.isCurrent) {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
        ),
      );
    }

    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: stop.isPassed ? Colors.grey : Colors.grey[300],
        shape: BoxShape.circle,
      ),
    );
  }

  Color _getLineColor(RouteStop stop) {
    if (stop.isPassed) return Colors.grey;
    if (stop.isCurrent) return Colors.blue;
    return Colors.grey.shade300;
  }
}