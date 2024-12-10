import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:v_express/find_bus_details/controller/search_bus_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_express/find_bus_details/controller/search_bus_controller.dart';

class BusDetailsScreen extends GetWidget<SearchbusController> {
  BusDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bus Name"',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "sas",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              'Destination:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              'Departure Time: ',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(height: 20, thickness: 2),
            Text(
              'Routes Crossed:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
           
          
          
          ],
        ),
      ),
    );
  }
}
