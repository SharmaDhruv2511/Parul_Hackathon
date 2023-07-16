// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:pu_hack/views/form.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int currentHour = now.hour;
    String greetingText;

    if (currentHour < 12) {
      greetingText = 'Good Morning';
    } else if (currentHour < 17) {
      greetingText = 'Good Afternoon';
    } else {
      greetingText = 'Good Evening';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("$greetingText, Dhruv!"),
        leading: Icon(Icons.person),
        backgroundColor: Colors.black,
        elevation: 4.0,
      ),
      body: Column(
        children: [
          10.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SizedBox(
                            height: 30,
                            child: Icon(
                              Icons.search,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search a Ride',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                10.widthBox,
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FormPage())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text('Offer a Ride'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
