import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:v_express/find_bus_details/controller/bus_list_controller.dart';
import 'package:v_express/routes/app_routes.dart';

class BusListScreen extends StatelessWidget {
  final controller = Get.put(BusListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Buses')
            .animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2, end: 0),
        backgroundColor: Color(0xFF3498DB),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _showFilterBottomSheet(context),
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
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator()
                .animate()
                .scale()
                .fadeIn(duration: 500.ms),
            );
          }

          if (controller.busList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.directions_bus_outlined, 
                       size: 64, 
                       color: Colors.white)
                    .animate()
                    .scale(duration: 600.ms)
                    .fadeIn(),
                  SizedBox(height: 16),
                  Text('No buses available',
                      style: TextStyle(fontSize: 18, color: Colors.white))
                    .animate()
                    .fadeIn(delay: 200.ms)
                    .slideY(begin: 0.2, end: 0),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: controller.busList.length,
            itemBuilder: (context, index) {
              final bus = controller.busList[index];
              return _buildBusCard(bus, index);
            },
          );
        }),
      ),
    );
  }

  Widget _buildBusCard(Bus bus, int index) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => Get.toNamed(AppRoutes.busTrackingScreen),
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            _buildBusHeader(bus),
            _buildBusDetails(bus),
          ],
        ),
      ),
    )
    .animate()
    .fadeIn(delay: Duration(milliseconds: 100 * index))
    .slideX(begin: 0.2, end: 0, duration: 600.ms);
  }

  Widget _buildBusHeader(Bus bus) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3498DB), Color(0xFF2980B9)],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bus.busName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                bus.busNumber,
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              bus.busType,
              style: TextStyle(
                color: Color(0xFF3498DB),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusDetails(Bus bus) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildRouteInfo(bus),
          Divider(height: 32),
          _buildTravelInfo(bus),
          Divider(height: 32),
          _buildAmenitiesAndPrice(bus),
          SizedBox(height: 16),
          _buildBookButton(bus),
        ],
      ),
    );
  }

  Widget _buildRouteInfo(Bus bus) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.circle, size: 12, color: Color(0xFF3498DB)),
                  SizedBox(width: 8),
                  Text(
                    bus.startPoint,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  bus.departureTime,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFF3498DB).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.arrow_forward, 
                        color: Color(0xFF3498DB), 
                        size: 20),
            ),
            SizedBox(height: 4),
            Text(
              bus.duration,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    bus.endPoint,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.circle, size: 12, color: Color(0xFF3498DB)),
                ],
              ),
              Text(
                bus.arrivalTime,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTravelInfo(Bus bus) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF3498DB).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoItem(
            icon: Icons.event_seat,
            label: 'Available Seats',
            value: bus.availableSeats.toString(),
          ),
          _buildInfoItem(
            icon: Icons.access_time,
            label: 'Duration',
            value: bus.duration,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Icon(icon, color: Color(0xFF3498DB)),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAmenitiesAndPrice(Bus bus) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: bus.amenities.map((amenity) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF3498DB).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xFF3498DB).withOpacity(0.3),
                  ),
                ),
                child: Text(
                  amenity,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF3498DB),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Starting from',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            Text(
              '₹${bus.fare.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2ECC71),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBookButton(Bus bus) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () => Get.toNamed('/booking', arguments: bus),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3498DB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 3,
        ),
        child: Text(
          'Select Seats',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Filter Buses',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        'All',
                        'AC',
                        'Non-AC',
                        'Sleeper',
                        'Seater',
                      ].map((filter) => _buildFilterChip(filter, context)).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).animate().slideY(begin: 1, end: 0, duration: 300.ms);
      },
    );
  }

  Widget _buildFilterChip(String filter, BuildContext context) {
    return Obx(() => FilterChip(
      label: Text(filter),
      selected: controller.selectedFilter.value == filter,
      selectedColor: Color(0xFF3498DB).withOpacity(0.2),
      checkmarkColor: Color(0xFF3498DB),
      labelStyle: TextStyle(
        color: controller.selectedFilter.value == filter
            ? Color(0xFF3498DB)
            : Colors.grey[700],
      ),
      onSelected: (selected) {
        if (selected) {
          controller.filterBuses(filter);
          Navigator.pop(context);
        }
      },
    ));
  }
}