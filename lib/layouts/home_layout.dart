import 'package:flutter/material.dart';
import 'package:neko/components/main_navbar.dart';

Widget homeLayout({required BuildContext context, required Widget component}) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return Container(
    width: width,
    height: height,
    color: Colors.black,
    child: Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: component,
        ),
        Positioned(
          left: width * 0.05,
          bottom: 25,
          child: mainNavbar(context),
        )
      ],
    ),
  );
}
