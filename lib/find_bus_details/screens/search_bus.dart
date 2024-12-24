import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
        title: Text('Search Routes')
            .animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2, end: 0),
        backgroundColor: Color(0xFF3498DB),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: controller.clearAll,
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
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            controller.closeAllDropdowns();
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
                  onDropdownVisibilityChanged: (value) => 
                    controller.toggleDropdown('district', value),
                  icon: Icons.location_city,
                ).animate()
                 .fadeIn(duration: 500.ms)
                 .slideY(begin: -0.2, end: 0),

                SizedBox(height: 16),
                _buildSearchField(
                  controller: controller.startPointSearchController,
                  hint: 'Search Start Point',
                  selectedValue: controller.selectedStartPoint,
                  isDropdownVisible: controller.isStartPointDropdownVisible,
                  filteredItems: controller.filteredStartPoints,
                  onDropdownVisibilityChanged: (value) => 
                    controller.toggleDropdown('start', value),
                  icon: Icons.play_circle_outline,
                ).animate()
                 .fadeIn(duration: 600.ms, delay: 100.ms)
                 .slideY(begin: -0.2, end: 0),

                SizedBox(height: 16),
                _buildSearchField(
                  controller: controller.endPointSearchController,
                  hint: 'Search End Point',
                  selectedValue: controller.selectedEndPoint,
                  isDropdownVisible: controller.isEndPointDropdownVisible,
                  filteredItems: controller.filteredEndPoints,
                  onDropdownVisibilityChanged: (value) => 
                    controller.toggleDropdown('end', value),
                  icon: Icons.stop_circle_outlined,
                ).animate()
                 .fadeIn(duration: 700.ms, delay: 200.ms)
                 .slideY(begin: -0.2, end: 0),

                SizedBox(height: 24),
                _buildSearchButton()
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 300.ms)
                    .slideY(begin: 0.2, end: 0),
              ],
            ),
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
    required IconData icon,
  }) {
    return Obx(() => Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onDropdownVisibilityChanged(true),
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(icon, color: Color(0xFF3498DB)),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        selectedValue.value.isEmpty ? hint : selectedValue.value,
                        style: TextStyle(
                          color: selectedValue.value.isEmpty ? 
                            Colors.grey : Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      duration: Duration(milliseconds: 300),
                      turns: isDropdownVisible.value ? 0.5 : 0,
                      child: Icon(Icons.arrow_drop_down,
                          color: Color(0xFF3498DB)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.only(top: isDropdownVisible.value ? 4 : 0),
          child: AnimatedCrossFade(
            firstChild: Container(),
            secondChild: _buildDropdownContent(
              controller,
              filteredItems,
              selectedValue,
              onDropdownVisibilityChanged,
            ),
            crossFadeState: isDropdownVisible.value
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 300),
          ),
        ),
      ],
    ));
  }

  Widget _buildDropdownContent(
    TextEditingController controller,
    RxList<String> filteredItems,
    RxString selectedValue,
    Function(bool) onDropdownVisibilityChanged,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type to search...',
                prefixIcon: Icon(Icons.search, color: Color(0xFF3498DB)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF3498DB)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF3498DB), width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
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
                  selectedTileColor: Color(0xFF3498DB).withOpacity(0.1),
                  onTap: () {
                    selectedValue.value = item;
                    controller.text = item;
                    onDropdownVisibilityChanged(false);
                  },
                ).animate()
                  .fadeIn(delay: Duration(milliseconds: 50 * index))
                  .slideX(begin: 0.2, end: 0);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchButton() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [Color(0xFF3498DB), Color(0xFF2980B9)],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF3498DB).withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          controller.onPressSearch();
          if (controller.isSelectionEmpty()) {
            Get.snackbar(
              'Selection Required',
              'Please select at least one search criteria',
              backgroundColor: Colors.red[100],
              colorText: Colors.red[900],
              snackPosition: SnackPosition.BOTTOM,
            );
            return;
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          'Search Routes',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

// Add to SearchbusController
extension SearchbusControllerExtension on SearchbusController {
  void closeAllDropdowns() {
    isDistrictDropdownVisible.value = false;
    isStartPointDropdownVisible.value = false;
    isEndPointDropdownVisible.value = false;
  }

  void toggleDropdown(String type, bool value) {
    closeAllDropdowns();
    switch (type) {
      case 'district':
        isDistrictDropdownVisible.value = value;
        break;
      case 'start':
        isStartPointDropdownVisible.value = value;
        break;
      case 'end':
        isEndPointDropdownVisible.value = value;
        break;
    }
  }

  bool isSelectionEmpty() {
    return selectedDistrict.isEmpty && 
           selectedStartPoint.isEmpty && 
           selectedEndPoint.isEmpty;
  }
}
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
