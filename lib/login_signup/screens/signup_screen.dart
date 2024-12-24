import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/services.dart';
import 'package:v_express/login_signup/controller/signup_controller.dart';

class SignupScreen extends GetWidget<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF9C27B0), Color(0xFFBA68C8)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  _buildHeader(),
                  SizedBox(height: 30),
                  _buildSignupForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Icon(Icons.bus_alert_rounded, 
             size: 80, 
             color: Colors.white)
        .animate()
        .scale(duration: 600.ms)
        .fadeIn(),
        
        Text("Create Account",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ).animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: -0.2, end: 0),
        
        Text("Sign up to get started",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ).animate()
        .fadeIn(duration: 600.ms, delay: 200.ms)
        .slideY(begin: -0.2, end: 0),
      ],
    );
  }

  Widget _buildSignupForm() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            _buildInputField(
              controller: controller.firstNameController,
              hint: "First Name",
              icon: Icons.person_outline,
              delay: 0,
            ),
            _buildInputField(
              controller: controller.lastNameController,
              hint: "Last Name",
              icon: Icons.person_outline,
              delay: 100,
            ),
            _buildInputField(
              controller: controller.emailController,
              hint: "Email",
              icon: Icons.email_outlined,
              delay: 200,
            ),
            _buildInputField(
              controller: controller.mobileNoController,
              hint: "Mobile Number",
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              delay: 300,
            ),
            _buildPasswordField(
              controller: controller.passwordController,
              hint: "Password",
              isVisible: controller.isPasswordVisible,
              delay: 400,
            ),
            _buildPasswordField(
              controller: controller.confirmPasswordController,
              hint: "Confirm Password",
              isVisible: controller.isConfirmPasswordVisible,
              delay: 500,
            ),
            SizedBox(height: 30),
            _buildSignupButton(),
          ],
        ),
      ),
    ).animate()
    .fadeIn(duration: 800.ms)
    .slideY(begin: 0.2, end: 0);
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required int delay,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Color(0xFF9C27B0)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    ).animate()
    .fadeIn(delay: Duration(milliseconds: 200 + delay))
    .slideX(begin: -0.2, end: 0);
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required RxBool isVisible,
    required int delay,
  }) {
    return Obx(() => Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: !isVisible.value,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(Icons.lock_outline, color: Color(0xFF9C27B0)),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible.value ? Icons.visibility : Icons.visibility_off,
              color: Color(0xFF9C27B0),
            ),
            onPressed: () => isVisible.value = !isVisible.value,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    )).animate()
    .fadeIn(delay: Duration(milliseconds: 200 + delay))
    .slideX(begin: -0.2, end: 0);
  }

  Widget _buildSignupButton() {
    return Container(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: controller.onTapSignup,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF9C27B0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
        ),
        child: Text(
          "CREATE ACCOUNT",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}