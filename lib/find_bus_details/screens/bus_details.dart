import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:v_express/find_bus_details/controller/search_bus_controller.dart';

class BusDetailsScreen extends GetWidget<SearchbusController> {
  BusDetailsScreen({super.key});
  int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Details'),
      ),
      body: SingleChildScrollView(
        child: EasyStepper(
            direction: Axis.vertical,
            activeStep: activeStep,
            steps: [
              EasyStep(
                customStep: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Opacity(
                    opacity: activeStep >= 0 ? 1 : 0.3,
                    child: Image.asset('assets/1.png'),
                  ),
                ),
                customTitle: const Text(
                  'Dash 1',
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
      ),
    );
  }
}
