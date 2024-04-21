import 'package:flutter/material.dart';

Widget textNormal(String text, {fontSize = 18.0, color = Colors.white}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontFamily: 'Montserrat',
      color: color,
      decoration: TextDecoration.none,
    ),
  );
}
