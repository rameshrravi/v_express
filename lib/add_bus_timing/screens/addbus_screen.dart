import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_express/add_bus_timing/controller/addbus_controller.dart';

class AddbusScreen extends GetWidget<AddbusController> {
  const AddbusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bus Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.busName,
                        decoration: InputDecoration(
                          hintText: "Bus Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Colors.purple.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Start From',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none),
                                fillColor: Colors.purple.withOpacity(0.1),
                                filled: true,
                                prefixIcon: const Icon(Icons.person),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              onTap: () {
                                controller.showTimepickerFrom(Get.context!, 0);
                              },
                              controller: controller.fromTime,
                              decoration: InputDecoration(
                                hintText: 'Time',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none),
                                fillColor: Colors.purple.withOpacity(0.1),
                                filled: true,
                                prefixIcon: const Icon(Icons.access_time),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'End At',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none),
                                fillColor: Colors.purple.withOpacity(0.1),
                                filled: true,
                                prefixIcon: const Icon(Icons.person),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              onTap: () {
                                controller.showTimepickerFrom(Get.context!, 1);
                              },
                              readOnly: true,
                              controller: controller.toTime,
                              decoration: InputDecoration(
                                hintText: 'Time',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none),
                                fillColor: Colors.purple.withOpacity(0.1),
                                filled: true,
                                prefixIcon: const Icon(Icons.access_time),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.selectedIndex.value,
                          itemBuilder: (BuildContext context, int index) {
                            return _buildRoute(index);
                          },
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.purple, // Text color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onPressed: () {
                          controller.selectedIndex.value++;
                        },
                        child: const Text("Add Route"),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.purple, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            onPressed: () {
              controller.saveBusDetails();
            },
            child: const Text("Save Details"),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText,
      [TextEditingController? controller]) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildRoute(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _buildTextField('Route Name'),
          ),
          Expanded(
            child: _buildTextField('Time'),
          ),
          IconButton(
            onPressed: () {
              controller.selectedIndex.value--;
            },
            icon: const Icon(Icons.remove_circle),
          ),
        ],
      ),
    );
  }
}