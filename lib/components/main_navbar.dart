import 'package:flutter/material.dart';

Widget mainNavbar(BuildContext context) {
  const iconSize = 25.0;
  const iconColor = Color.fromRGBO(255, 255, 255, 0.5);
  var width = MediaQuery.of(context).size.width;
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
      width: width * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
      color: const Color(0x22FFFFFF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(
              Icons.home_mini_outlined,
              color: iconColor,
              size: iconSize,
              textDirection: TextDirection.ltr,
              semanticLabel: 'Home',
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/trending');
            },
            icon: const Icon(
              Icons.animation_rounded,
              color: iconColor,
              size: iconSize,
              textDirection: TextDirection.ltr,
              semanticLabel: 'Trending',
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(
              Icons.person_outline_rounded,
              color: iconColor,
              size: iconSize,
              textDirection: TextDirection.ltr,
              semanticLabel: 'Profile',
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/setting');
            },
            icon: const Icon(
              Icons.settings,
              color: iconColor,
              size: iconSize,
              textDirection: TextDirection.ltr,
              semanticLabel: 'Setting',
            ),
          ),
        ],
      ),
    ),
  );
}
