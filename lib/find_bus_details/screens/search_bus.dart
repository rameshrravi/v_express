import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:v_express/find_bus_details/controller/search_bus_controller.dart';



class SearchBusScreen extends StatelessWidget {
  final SearchbusController controller = Get.put(SearchbusController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Routes'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: controller.clearAll,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          controller.isDistrictDropdownVisible.value = false;
          controller.isStartPointDropdownVisible.value = false;
          controller.isEndPointDropdownVisible.value = false;
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchField(
                controller: controller.districtSearchController,
                hint: 'Search District',
                selectedValue: controller.selectedDistrict,
                isDropdownVisible: controller.isDistrictDropdownVisible,
                filteredItems: controller.filteredDistricts,
                onDropdownVisibilityChanged: (value) {
                  controller.isDistrictDropdownVisible.value = value;
                  controller.isStartPointDropdownVisible.value = false;
                  controller.isEndPointDropdownVisible.value = false;
                },
              ),
              SizedBox(height: 16),
              _buildSearchField(
                controller: controller.startPointSearchController,
                hint: 'Search Start Point',
                selectedValue: controller.selectedStartPoint,
                isDropdownVisible: controller.isStartPointDropdownVisible,
                filteredItems: controller.filteredStartPoints,
                onDropdownVisibilityChanged: (value) {
                  controller.isDistrictDropdownVisible.value = false;
                  controller.isStartPointDropdownVisible.value = value;
                  controller.isEndPointDropdownVisible.value = false;
                },
              ),
              SizedBox(height: 16),
              _buildSearchField(
                controller: controller.endPointSearchController,
                hint: 'Search End Point',
                selectedValue: controller.selectedEndPoint,
                isDropdownVisible: controller.isEndPointDropdownVisible,
                filteredItems: controller.filteredEndPoints,
                onDropdownVisibilityChanged: (value) {
                  controller.isDistrictDropdownVisible.value = false;
                  controller.isStartPointDropdownVisible.value = false;
                  controller.isEndPointDropdownVisible.value = value;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                 controller.onPressSearch();
                  if (controller.selectedDistrict.isEmpty && 
                      controller.selectedStartPoint.isEmpty && 
                      controller.selectedEndPoint.isEmpty) {
                    Get.snackbar(
                      'Selection Required',
                      'Please select at least one search criteria',
                      backgroundColor: Colors.red[100],
                      colorText: Colors.red[900],
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return;
                  }
                  // Implement search logic here
                  print('Selected District: ${controller.selectedDistrict.value}');
                  print('Selected Start: ${controller.selectedStartPoint.value}');
                  print('Selected End: ${controller.selectedEndPoint.value}');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Search Routes',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField({
    required TextEditingController controller,
    required String hint,
    required RxString selectedValue,
    required RxBool isDropdownVisible,
    required RxList<String> filteredItems,
    required Function(bool) onDropdownVisibilityChanged,
  }) {
    return Obx(() => Column(
      children: [
        InkWell(
          onTap: () => onDropdownVisibilityChanged(true),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedValue.value.isEmpty ? hint : selectedValue.value,
                    style: TextStyle(
                      color: selectedValue.value.isEmpty ? 
                        Colors.grey : Colors.black,
                    ),
                  ),
                ),
                Icon(
                  isDropdownVisible.value ? 
                    Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        if (isDropdownVisible.value) ...[
          SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Type to search...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return ListTile(
                        title: Text(item),
                        selected: item == selectedValue.value,
                        onTap: () {
                          selectedValue.value = item;
                          controller.text = item;
                          onDropdownVisibilityChanged(false);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    ));
  }
}