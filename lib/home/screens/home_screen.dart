import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_express/home/controller/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  child: const Text('hello'),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  child: const Text('hello'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
