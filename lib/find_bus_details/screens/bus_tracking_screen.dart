import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:v_express/find_bus_details/controller/bus_tracking_details.dart';

class BusTrackingScreen extends StatelessWidget {
  final controller = Get.put(TrackingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Tracking')
            .animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2, end: 0),
        backgroundColor: Color(0xFF3498DB),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => controller.loadRouteStops(),
          ).animate()
            .scale(duration: 300.ms)
            .fadeIn(),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3498DB), Color(0xFFF5F6FA)],
            stops: [0.0, 0.3],
          ),
        ),
        child: Column(
          children: [
            _buildBusInfoCard(),
            Expanded(child: _buildRouteTimeline()),
          ],
        ),
      ),
    );
  }

  Widget _buildBusInfoCard() {
    return Obx(() => Card(
      margin: EdgeInsets.all(16),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFF5F6FA)],
          ),
        ),
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
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      controller.busNumber.value,
                      style: TextStyle(
                        color: Color(0xFF7F8C8D),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2ECC71), Color(0xFF27AE60)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF2ECC71).withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
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
            ).animate()
              .fadeIn(duration: 600.ms)
              .slideX(begin: -0.2, end: 0),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF3498DB).withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
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
            ).animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .slideY(begin: 0.2, end: 0),
          ],
        ),
      ),
    ));
  }

  Widget _buildInfoColumn(String label, String value, IconData icon) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF3498DB).withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Color(0xFF3498DB), size: 24),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF7F8C8D),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
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
          index: index,
        ).animate()
          .fadeIn(delay: Duration(milliseconds: 100 * index))
          .slideX(begin: 0.2, end: 0);
      },
    ));
  }

  Widget _buildTimelineItem(
    RouteStop stop, {
    bool isFirst = false,
    bool isLast = false,
    required int index,
  }) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 60,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              stop.time,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF7F8C8D),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                width: 2,
                height: 30,
                color: isFirst ? Colors.transparent : _getLineColor(stop),
              ),
              _buildTimelineDot(stop),
              Container(
                width: 2,
                height: 30,
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
                color: stop.isCurrent
                    ? Color(0xFF3498DB).withOpacity(0.1)
                    : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: stop.isCurrent
                      ? Color(0xFF3498DB)
                      : Colors.transparent,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stop.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: stop.isPassed
                          ? Color(0xFF7F8C8D)
                          : Color(0xFF2C3E50),
                    ),
                  ),
                  if (stop.isCurrent) ...[
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(0xFF3498DB),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.directions_bus,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Bus is here',
                          style: TextStyle(
                            color: Color(0xFF3498DB),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ).animate(onPlay: (controller) => controller.repeat())
                      .fadeIn(duration: 500.ms)
                      .then()
                      .fadeOut(duration: 500.ms),
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
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Color(0xFF3498DB),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF3498DB).withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
      ).animate(onPlay: (controller) => controller.repeat())
        .scale(
          duration: 1000.ms,
          begin: Offset(1, 1),
          end: Offset(1.2, 1.2),
        )
        .then()
        .scale(
          duration: 1000.ms,
          begin: Offset(1.2, 1.2),
          end: Offset(1, 1),
        );
    }

    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: stop.isPassed ? Color(0xFF95A5A6) : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: stop.isPassed ? Color(0xFF95A5A6) : Color(0xFFBDC3C7),
          width: 3,
        ),
      ),
    );
  }

  Color _getLineColor(RouteStop stop) {
    if (stop.isPassed) return Color(0xFF95A5A6);
    if (stop.isCurrent) return Color(0xFF3498DB);
    return Color(0xFFBDC3C7);
  }
}