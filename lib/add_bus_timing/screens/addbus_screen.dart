import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:v_express/add_bus_timing/controller/addbus_controller.dart';

class AddbusScreen extends StatelessWidget {
  final AddbusController controller = Get.put(AddbusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Management')
            .animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2, end: 0),
        backgroundColor: Color(0xFF3498DB),
        elevation: 0,
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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildLocationDropdown()
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .slideY(begin: -0.2, end: 0),
                
                SizedBox(height: 16),
                
                _buildBusNameField()
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 100.ms)
                    .slideY(begin: -0.2, end: 0),
                
                SizedBox(height: 16),
                
                _buildStartLocationCard()
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 200.ms)
                    .slideY(begin: -0.2, end: 0),
                
                SizedBox(height: 16),
                
                _buildEndLocationCard()
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 300.ms)
                    .slideY(begin: -0.2, end: 0),
                
                SizedBox(height: 16),
                
                _buildRoutesCard()
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 400.ms)
                    .slideY(begin: -0.2, end: 0),
                
                SizedBox(height: 16),
                
                _buildSaveButton()
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 500.ms)
                    .slideY(begin: 0.2, end: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xFFF5F6FA)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }

  Widget _buildLocationDropdown() {
    return _buildCard(
      child: Obx(() => DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Select Location',
          labelStyle: TextStyle(color: Color(0xFF3498DB)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF3498DB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF3498DB).withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF3498DB), width: 2),
          ),
        ),
        value: controller.selectedLocation.value.isEmpty 
            ? null 
            : controller.selectedLocation.value,
        items: controller.locationList.map((location) {
          return DropdownMenuItem(
            value: location,
            child: Text(location),
          );
        }).toList(),
        onChanged: (value) {
          controller.selectedLocation.value = value ?? '';
        },
      )),
    );
  }

  Widget _buildBusNameField() {
    return _buildCard(
      child: TextFormField(
        controller: controller.busNameController,
        decoration: _buildInputDecoration('Bus Name', Icons.directions_bus),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter bus name';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildStartLocationCard() {
    return _buildCard(
      child: Column(
        children: [
          TextFormField(
            controller: controller.startLocationController,
            decoration: _buildInputDecoration('Start From', Icons.location_on),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter start location';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          _buildTimePickerField(
            controller.startTime,
            'Start Time',
            Get.context!,
          ),
        ],
      ),
    );
  }

  Widget _buildEndLocationCard() {
    return _buildCard(
      child: Column(
        children: [
          TextFormField(
            controller: controller.endLocationController,
            decoration: _buildInputDecoration('End To', Icons.location_off),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter end location';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          _buildTimePickerField(
            controller.endTime,
            'End Time',
            Get.context!,
          ),
        ],
      ),
    );
  }

  Widget _buildRoutesCard() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Routes',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          SizedBox(height: 16),
          Obx(() => Column(
            children: [
              ...controller.routes.asMap().entries.map((entry) {
                final index = entry.key;
                final route = entry.value;
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFF3498DB).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: route.routeName,
                          decoration: _buildInputDecoration('Route Name', Icons.route),
                          onChanged: (value) {
                            route.routeName = value;
                          },
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter route name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      TextButton.icon(
                        icon: Icon(Icons.access_time, color: Color(0xFF3498DB)),
                        label: Text(
                          route.time.format(Get.context!),
                          style: TextStyle(color: Color(0xFF3498DB)),
                        ),
                        onPressed: () async {
                          final time = await showTimePicker(
                            context: Get.context!,
                            initialTime: route.time,
                          );
                          if (time != null) {
                            route.time = time;
                            controller.routes.refresh();
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => controller.removeRoute(index),
                      ).animate(onPlay: (controller) => controller.repeat())
                        .shimmer(duration: 1500.ms),
                    ],
                  ),
                ).animate()
                  .fadeIn(delay: Duration(milliseconds: 100 * index))
                  .slideX(begin: 0.2, end: 0);
              }).toList(),
            ],
          )),
          SizedBox(height: 16),
          ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add Route'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3498DB),
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: controller.addNewRoute,
          ).animate(onPlay: (controller) => controller.repeat())
            .shimmer(duration: 1500.ms),
        ],
      ),
    );
  }

  Widget _buildTimePickerField(
    Rx<TimeOfDay> timeValue,
    String label,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () async {
        final time = await showTimePicker(
          context: context,
          initialTime: timeValue.value,
        );
        if (time != null) {
          timeValue.value = time;
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          decoration: _buildInputDecoration(label, Icons.access_time),
          controller: TextEditingController(
            text: timeValue.value.format(context),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Color(0xFF3498DB)),
      prefixIcon: Icon(icon, color: Color(0xFF3498DB)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFF3498DB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFF3498DB).withOpacity(0.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFF3498DB), width: 2),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }

  Widget _buildSaveButton() {
    return Container(
      height: 56,
      child: ElevatedButton(
        onPressed: controller.saveRouteDetails,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3498DB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 8,
        ),
        child: Text(
          'Save Route Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ).animate(onPlay: (controller) => controller.repeat())
      .shimmer(duration: 1500.ms);
  }
}