import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_express/addbusand_timing/controller/addbus_controller.dart';

class AddbusScreen extends GetWidget<AddbusController> {
  const AddbusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bus Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.busName,
                  decoration: const InputDecoration(
                    labelText: 'Bus Name',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controller.busStartFrom,
                        decoration: const InputDecoration(
                          labelText: 'From',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onTap: () =>
                            controller.showTimepickerFrom(Get.context!, 0),
                        readOnly: true,
                        controller: controller.fromTime,
                        decoration: const InputDecoration(
                          labelText: 'Time',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controller.busEnd,
                        decoration: const InputDecoration(
                          labelText: 'To',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onTap: () =>
                            controller.showTimepickerFrom(Get.context!, 1),
                        readOnly: true,
                        controller: controller.toTime,
                        decoration: const InputDecoration(
                          labelText: 'Time',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () {
                            controller.selectedIndex.value =
                                controller.selectedIndex.value + 1;
                            print(controller.selectedIndex.value);
                          },
                          child: const Text("Add Route"))),
                ],
              ),
              Obx(() => SizedBox(
                    height: controller.selectedIndex.value * 50.0,
                    child: ListView.builder(
                      itemCount: controller.selectedIndex.value,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Route Name',
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Time',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text("Remove"),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )),
              ElevatedButton(
                onPressed: () {},
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
