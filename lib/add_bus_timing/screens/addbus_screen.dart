import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_express/add_bus_timing/controller/addbus_controller.dart';

// class AddbusScreen extends GetWidget<AddbusController> {
//   const AddbusScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Bus Details'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(8.0),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Form(
//                   child: Column(
//                     children: [
//                       Stack(
//                         children: [
//                           Column(
//                             children: [
//                               TextField(
//                                 onChanged: (value) {
//                                   controller.filterDistricts(
//                                       value); // Assuming this method exists in your controller
//                                 },
//                                 decoration: InputDecoration(
//                                   hintText: "Search District",
                                
//                                   fillColor: Colors.purple.withOpacity(0.1),
//                                   filled: true,
//                                   prefixIcon: const Icon(Icons.search),
//                                 ),
//                               ),
//                               const SizedBox(height: 16),
//                               // Other input fields...
//                             ],
//                           ),
//                           Positioned(
//                             top: 60,
//                             child: SizedBox(
//                               height: 200, // Adjust height as needed
//                               child: Obx(() => ListView.builder(
//                                     itemCount: controller
//                                         .filteredDistricts.value.length,
//                                     itemBuilder: (context, index) {
//                                       return ListTile(
//                                         title: Text(controller
//                                             .filteredDistricts.value[index]),
//                                         onTap: () {
//                                           // Populate the search field with the selected district
//                                           // Assuming you have a controller method to set the bus name
//                                           controller.busName.text = controller
//                                               .filteredDistricts.value[index];
//                                           controller.filteredDistricts
//                                               .clear(); // Clear suggestions
//                                         },
//                                       );
//                                     },
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         controller: controller.busName,
//                         decoration: InputDecoration(
//                           hintText: "Bus Name",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(18),
//                               borderSide: BorderSide.none),
//                           fillColor: Colors.purple.withOpacity(0.1),
//                           filled: true,
//                           prefixIcon: const Icon(Icons.person),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 hintText: 'Start From',
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(18),
//                                     borderSide: BorderSide.none),
//                                 fillColor: Colors.purple.withOpacity(0.1),
//                                 filled: true,
//                                 prefixIcon: const Icon(Icons.person),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Expanded(
//                             child: TextFormField(
//                               readOnly: true,
//                               onTap: () {
//                                 controller.showTimepickerFrom(Get.context!, 0);
//                               },
//                               controller: controller.fromTime,
//                               decoration: InputDecoration(
//                                 hintText: 'Time',
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(18),
//                                     borderSide: BorderSide.none),
//                                 fillColor: Colors.purple.withOpacity(0.1),
//                                 filled: true,
//                                 prefixIcon: const Icon(Icons.access_time),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 hintText: 'End At',
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(18),
//                                     borderSide: BorderSide.none),
//                                 fillColor: Colors.purple.withOpacity(0.1),
//                                 filled: true,
//                                 prefixIcon: const Icon(Icons.person),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Expanded(
//                             child: TextFormField(
//                               onTap: () {
//                                 controller.showTimepickerFrom(Get.context!, 1);
//                               },
//                               readOnly: true,
//                               controller: controller.toTime,
//                               decoration: InputDecoration(
//                                 hintText: 'Time',
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(18),
//                                     borderSide: BorderSide.none),
//                                 fillColor: Colors.purple.withOpacity(0.1),
//                                 filled: true,
//                                 prefixIcon: const Icon(Icons.access_time),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Obx(
//                         () => ListView.builder(
//                           physics: const NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: controller.selectedIndex.value,
//                           itemBuilder: (BuildContext context, int index) {
//                             return _buildRoute(index);
//                           },
//                         ),
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           foregroundColor: Colors.white,
//                           backgroundColor: Colors.purple, // Text color
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 24, vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(18.0),
//                           ),
//                         ),
//                         onPressed: () {
//                           controller.selectedIndex.value++;
//                         },
//                         child: const Text("Add Route"),
//                       ),
//                       const SizedBox(height: 16),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.white,
//               backgroundColor: Colors.purple, // Text color
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(18.0),
//               ),
//             ),
//             onPressed: () {
//               controller.saveBusDetails();
//             },
//             child: const Text("Save Details"),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField(String labelText,
//       [TextEditingController? controller]) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: const Color.fromARGB(255, 255, 255, 255),
//       ),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: labelText,
//           border: InputBorder.none,
//           focusedBorder: InputBorder.none,
//           enabledBorder: InputBorder.none,
//           errorBorder: InputBorder.none,
//           disabledBorder: InputBorder.none,
//           contentPadding: const EdgeInsets.symmetric(
//             vertical: 10,
//             horizontal: 16,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildRoute(int index) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: _buildTextField('Route Name'),
//           ),
//           Expanded(
//             child: _buildTextField('Time'),
//           ),
//           IconButton(
//             onPressed: () {
//               controller.selectedIndex.value--;
//             },
//             icon: const Icon(Icons.remove_circle),
//           ),
//         ],
//       ),
//     );
//   }
// }


class AddbusScreen extends StatelessWidget {
  final AddbusController controller = Get.put(AddbusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Management'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Location Dropdown
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Obx(() => DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Location',
                      border: OutlineInputBorder(),
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
                ),
              ),
              
              SizedBox(height: 16),
              
              // Bus Name TextField
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: controller.busNameController,
                    decoration: InputDecoration(
                      labelText: 'Bus Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter bus name';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              
              SizedBox(height: 16),
              
              // Start From Location and Time
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.startLocationController,
                        decoration: InputDecoration(
                          labelText: 'Start From',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter start location';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                       
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: controller.startTime.value,
                                );
                                if (time != null) {
                                  controller.startTime.value = time;
                                }
                              },
                              child: AbsorbPointer(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Start Time',
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.access_time),
                                  ),
                                  controller: TextEditingController(
                                    text: controller.startTime.value.format(context),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 16),
              
              // End To Location and Time
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.endLocationController,
                        decoration: InputDecoration(
                          labelText: 'End To',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter end location';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                         
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: controller.endTime.value,
                                );
                                if (time != null) {
                                  controller.endTime.value = time;
                                }
                              },
                              child: AbsorbPointer(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'End Time',
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.access_time),
                                  ),
                                  controller: TextEditingController(
                                    text: controller.endTime.value.format(context),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 16),
              
              // Routes List
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Routes',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 8),
                      Obx(() => Column(
                        children: [
                          ...controller.routes.asMap().entries.map((entry) {
                            final index = entry.key;
                            final route = entry.value;
                            return Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      initialValue: route.routeName,
                                      decoration: InputDecoration(
                                        labelText: 'Route Name',
                                        border: OutlineInputBorder(),
                                      ),
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
                                    icon: Icon(Icons.access_time),
                                    label: Text(route.time.format(context)),
                                    onPressed: () async {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: route.time,
                                      );
                                      if (time != null) {
                                        route.time = time;
                                        controller.routes.refresh();
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () => controller.removeRoute(index),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      )),
                      ElevatedButton.icon(
                        icon: Icon(Icons.add),
                        label: Text('Add Route'),
                        onPressed: controller.addNewRoute,
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 16),
              
              // Save Button
              ElevatedButton(
                onPressed: controller.saveRouteDetails,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Save Route Details',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}