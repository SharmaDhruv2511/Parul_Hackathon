// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pu_hack/controller/home_controller.dart';
import 'package:pu_hack/screens/home_screen.dart';
import 'package:pu_hack/views/profile.dart';
import 'package:pu_hack/views/ride1.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navbody = [
      HomeScreen(),
      Ride1(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: navbody.elementAt(controller.currentNavIndex.value),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.bike_scooter_sharp,
                text: "RIde",
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
              ),
            ],
            selectedIndex: controller.currentNavIndex.value,
            onTabChange: (value) {
              setState(() {
                controller.currentNavIndex.value = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
