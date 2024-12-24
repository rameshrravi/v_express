import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  final user = User(
    name: "John Doe",
    email: "john@example.com",
    phone: "+1234567890",
    points: 1250,
    tripsCompleted: 45,
  ).obs;
  
  final isEditing = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  
  void toggleEdit() {
    isEditing.value = !isEditing.value;
    if (isEditing.value) {
      nameController.text = user.value.name;
      emailController.text = user.value.email;
      phoneController.text = user.value.phone;
    }
  }
  
  void updateProfile() {
    user.update((val) {
      val?.name = nameController.text;
      val?.email = emailController.text;
      val?.phone = phoneController.text;
    });
    isEditing.value = false;
  }
}

class User {
  String name;
  String email;
  String phone;
  int points;
  int tripsCompleted;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.points,
    required this.tripsCompleted,
  });
}