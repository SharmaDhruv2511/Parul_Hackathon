// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../services/ride_services.dart';

class Ride1 extends StatelessWidget {
  const Ride1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        leading: Icon(Icons.bike_scooter, color: Colors.white),
        title: "Your Rides".text.color(Colors.white).make(),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder(
        stream: RideServices.getRide(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Container(color: Colors.black);
          } else {
            var getRide = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  3,
                  (index) => ListTile(
                    leading: Image.asset(
                      "assets/images/ride.png",
                      // height: 100,
                      // width: 100,
                      fit: BoxFit.cover,
                    ),
                    title: "Rider Name".text.make(),
                    subtitle: "Destination".text.make(),
                    trailing: "\$10".text.make(),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
