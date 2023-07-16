// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pu_hack/controller/firebase_consts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controller/auth_controller.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var controller = Get.put(AuthController());
  final fireStore = FirebaseFirestore.instance.collection(vehicleCollection);

  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay(hour: 6, minute: 55);

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    ).then((value) => {
          setState(() {
            _dateTime = value!;
          })
        });
  }

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) => {
          setState(() {
            _timeOfDay = value!;
          })
        });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController pickupController = TextEditingController();
  TextEditingController dropController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          shrinkWrap: true,
          children: [
            //Name
            Text('Vehicle Owner (Name)'),
            5.heightBox,
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Name',
              ),
            ),
            10.heightBox,

            //Vehicle
            Text('Vehicle Number'),
            5.heightBox,
            TextField(
              controller: vehicleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'GJ-05 EQ 0632',
              ),
            ),
            10.heightBox,

            //Email
            Text('Email'),
            5.heightBox,
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Email',
              ),
            ),
            10.heightBox,

            //Mobile
            Text('Mobile'),
            5.heightBox,
            TextField(
              controller: mobileController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Mobile',
              ),
            ),
            10.heightBox,

            // Address
            Text('From'),
            5.heightBox,
            TextField(
              controller: pickupController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Address',
              ),
            ),
            10.heightBox,

            //From
            Text('To'),
            5.heightBox,
            TextField(
              controller: dropController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Address',
              ),
            ),
            10.heightBox,

            //Display choose Date
            Center(
                child: Text(
              _dateTime.toString(),
              style: TextStyle(fontSize: 20),
            )),
            10.heightBox,

            //Choose Date
            Center(
              child: MaterialButton(
                onPressed: _showDatePicker,
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Choose Date",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            20.heightBox,

            //Display choose Time
            Center(
                child: Text(
              _timeOfDay.format(context).toString(),
              style: TextStyle(fontSize: 20),
            )),
            10.heightBox,

            //Choose Time
            Center(
              child: MaterialButton(
                onPressed: _showTimePicker,
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Choose Time",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            20.heightBox,

            //Button
            ElevatedButton(
              onPressed: () async {
                controller.storeVehicleData(
                  context: context,
                  email: emailController.text,
                  name: nameController.text,
                  mobileNo: mobileController.text,
                  vehicleNo: vehicleController.text,
                  dropPoint: dropController.text,
                  pickupPoint: pickupController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
