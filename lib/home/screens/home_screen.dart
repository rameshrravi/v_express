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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      print("dkjbsdbsadsadsad");
                      controller.onPressAddMethod();
                    },
                    child: Card(
                      elevation: 20,
                      shadowColor: Colors.black,
                      color: Colors.greenAccent[100],
                      child: const SizedBox(
                        height: 100,
                        width: 100,
                        child: Center(child: Text('Bus Timing')),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: const SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(child: Text('News')),
                    ),
                  ),
                  Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: const SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(child: Text('')),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 20,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: const SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(child: Text('')),
                    ),
                  ),
                  Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: const SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(child: Text('')),
                    ),
                  ),
                  Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: const SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(child: Text('')),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
