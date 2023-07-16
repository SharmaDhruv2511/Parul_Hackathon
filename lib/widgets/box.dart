import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget detailsCard(width, String? text, {image}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        image,
        height: 30,
        width: 30,
      ),
      text!.text.size(16).make(),
      5.heightBox,
    ],
  )
      .box
      .white
      .rounded
      .width(width)
      .color(Colors.black12)
      .height(80)
      .padding(const EdgeInsets.all(4))
      .make();
}
