import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:v_express/login_signup/controller/Login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF9C27B0), Color(0xFFE1BEE7)],
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: MediaQuery.of(context).size.height - 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildHeader(),
                  _buildLoginForm(),
                  _buildSignUpOption(),
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
        Icon(
          Icons.bus_alert,
          size: 80,
          color: Colors.white,
        ).animate()
          .scale(duration: 600.ms)
          .fadeIn(),
        SizedBox(height: 20),
        Text(
          "Welcome Back",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ).animate()
          .fadeIn(duration: 600.ms)
          .slideY(begin: -0.2, end: 0),
        Text(
          "Sign in to continue",
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

  Widget _buildLoginForm() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            _buildTextField(
              controller: controller.mobileNoController,
              hint: "Email or Mobile number",
              icon: Icons.person_outline,
              delay: 0,
            ),
            SizedBox(height: 20),
            _buildTextField(
              controller: controller.passwordController,
              hint: "Password",
              icon: Icons.lock_outline,
              isPassword: true,
              delay: 100,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Color(0xFF9C27B0)),
                ),
              ),
            ).animate()
              .fadeIn(delay: 400.ms),
            SizedBox(height: 20),
            _buildLoginButton(),
          ],
        ),
      ),
    ).animate()
      .fadeIn(duration: 600.ms, delay: 300.ms)
      .slideY(begin: 0.2, end: 0);
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    required int delay,
  }) {
    return Container(
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
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Color(0xFF9C27B0)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.purple.withOpacity(0.05),
          filled: true,
        ),
      ),
    ).animate()
      .fadeIn(delay: Duration(milliseconds: 300 + delay))
      .slideX(begin: -0.2, end: 0);
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () => controller.loginBtn(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF9C27B0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
        ),
        child: Text(
          "LOGIN",
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

  Widget _buildSignUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.white70),
        ),
        TextButton(
          onPressed: () => controller.onPressSignUp(),
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ).animate()
      .fadeIn(delay: 800.ms);
  }
}