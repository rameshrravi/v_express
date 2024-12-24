import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:v_express/profile/controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3498DB), Color(0xFFF5F6FA)],
            stops: [0.0, 0.3],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(),
                _buildProfileContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Color(0xFF3498DB)),
              ).animate()
                .scale(duration: 600.ms)
                .fadeIn(),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Icon(Icons.camera_alt, size: 20, color: Color(0xFF3498DB)),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Obx(() => Text(
            controller.user.value.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )).animate()
            .fadeIn(duration: 600.ms)
            .slideY(begin: -0.2, end: 0),
        ],
      ),
    );
  }

  Widget _buildProfileContent() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildStats(),
            SizedBox(height: 30),
            Obx(() => controller.isEditing.value 
              ? _buildEditForm() 
              : _buildProfileInfo()),
          ],
        ),
      ),
    ).animate()
      .fadeIn(duration: 600.ms)
      .slideY(begin: 0.2, end: 0);
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem(
          icon: Icons.star,
          value: '${controller.user.value.points}',
          label: 'Points',
        ),
        _buildStatItem(
          icon: Icons.directions_bus,
          value: '${controller.user.value.tripsCompleted}',
          label: 'Trips',
        ),
      ],
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF3498DB).withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: Color(0xFF3498DB), size: 30),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Color(0xFF7F8C8D),
            ),
          ),
        ],
      ),
    ).animate()
      .fadeIn(duration: 600.ms)
      .scale(delay: 200.ms);
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        _buildInfoItem(Icons.person, 'Name', controller.user.value.name),
        _buildInfoItem(Icons.email, 'Email', controller.user.value.email),
        _buildInfoItem(Icons.phone, 'Phone', controller.user.value.phone),
        SizedBox(height: 30),
        _buildEditButton(),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF3498DB).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Color(0xFF3498DB)),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Color(0xFF7F8C8D),
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Color(0xFF2C3E50),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate()
      .fadeIn(duration: 600.ms)
      .slideX(begin: -0.2, end: 0);
  }

  Widget _buildEditForm() {
    return Column(
      children: [
        _buildTextField(
          controller: controller.nameController,
          label: 'Name',
          icon: Icons.person,
        ),
        _buildTextField(
          controller: controller.emailController,
          label: 'Email',
          icon: Icons.email,
        ),
        _buildTextField(
          controller: controller.phoneController,
          label: 'Phone',
          icon: Icons.phone,
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: _buildCancelButton(),
            ),
            SizedBox(width: 15),
            Expanded(
              child: _buildSaveButton(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Color(0xFF3498DB)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xFF3498DB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xFF3498DB).withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xFF3498DB), width: 2),
          ),
        ),
      ),
    ).animate()
      .fadeIn(duration: 600.ms)
      .slideX(begin: 0.2, end: 0);
  }

  Widget _buildEditButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: controller.toggleEdit,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3498DB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ).animate(onPlay: (controller) => controller.repeat())
      .shimmer(duration: 1500.ms);
  }

  Widget _buildSaveButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: controller.updateProfile,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3498DB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          'Save',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ).animate(onPlay: (controller) => controller.repeat())
      .shimmer(duration: 1500.ms);
  }

  Widget _buildCancelButton() {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        onPressed: controller.toggleEdit,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xFF3498DB)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          'Cancel',
          style: TextStyle(
            color: Color(0xFF3498DB),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}