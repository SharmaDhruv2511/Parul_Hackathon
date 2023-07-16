// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pu_hack/controller/firebase_consts.dart';
import 'package:pu_hack/services/ride_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controller/auth_controller.dart';
import '../screens/login_screen.dart';
import '../widgets/box.dart';
import '../widgets/lists.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: RideServices.getUser(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            var data = snapshot.data!.docs[0];
            return SafeArea(
                child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/profile_image.png",
                        width: 65,
                        fit: BoxFit.cover,
                      ).box.clip(Clip.antiAlias).roundedFull.make(),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data['name']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Text(
                            "${data['email']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      )),
                    ],
                  ),

                  20.heightBox,

                  // Expanded(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Row()
                  //       Image.asset("assets/images/wallet.png", width: 50, fit: BoxFit.fill,),
                  //       5.heightBox,
                  //       Text("Wallet", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                  //
                  //     ],
                  //   ).box.white.rounded.width((context.screenWidth / 3.5)).height(60).padding(EdgeInsets.all(4)).make(),
                  // )

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsCard(context.screenWidth / 3.4, "Your Rides",
                          image: "assets/images/ride.png"),
                      detailsCard(context.screenWidth / 3.4, "Wallet",
                          image: "assets/images/wallet.png"),
                    ],
                  ),

                  15.heightBox,

                  ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Image.asset(
                                profileIconList[index],
                                width: 22,
                              ),
                              title: profileButtonsList[index].text.make(),
                            );
                          })
                      .box
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .make(),
                  20.heightBox,
                  OutlinedButton(
                    onPressed: () async {
                      await Get.put(AuthController()).signoutMethod(context);
                      Get.offAll(() => LoginScreen());
                    },
                    child: "logout".text.black.make(),
                  )
                ],
              ),
            ));
          }
        },
      ),
    );
  }
}
