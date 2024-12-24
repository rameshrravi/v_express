import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_express/home/controller/home_controller.dart';
import 'package:v_express/routes/app_routes.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 30),
                _buildSearchBar(),
                SizedBox(height: 30),
                _buildMenuGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
            Text(
              'Manage your bus operations',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF7F8C8D),
              ),
            ),
          ],
        ),
        Hero(
          tag: 'profile',
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xFF3498DB),
            child: Icon(Icons.person, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
       // onChanged: controller.updateSearch,
        decoration: InputDecoration(
          hintText: 'Search anything...',
          prefixIcon: Icon(Icons.search, color: Color(0xFF3498DB)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
        ),
      ),
    );
  }

  Widget _buildMenuGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: [
        _buildMenuCard(
          'Add Bus',
          Icons.directions_bus,
          Color(0xFF3498DB),
          () => Get.toNamed(AppRoutes.addbusScreen),
        ),
        _buildMenuCard(
          'Find Bus',
          Icons.search,
          Color(0xFF2ECC71),
          () => Get.toNamed(AppRoutes.searchBusScreen),
        ),
        _buildMenuCard(
          'Add Business',
          Icons.business,
          Color(0xFFE74C3C),
          () => controller.onPressRewardPoints(),
        ),
        _buildMenuCard(
          'Add  Village Details',
          Icons.location_on,
          Color(0xFF9B59B6),
          () => Get.toNamed('/analytics'),
        ),
        _buildMenuCard(
          'Profile',
          Icons.person,
          Color(0xFF9B59B6),
          () => controller.onPressProfile(),
        ),
      ],
    );
  }

  Widget _buildMenuCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return Hero(
      tag: title,
      child: Material(
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          child: InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: color, size: 30),
                  ),
                  SizedBox(height: 15),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
