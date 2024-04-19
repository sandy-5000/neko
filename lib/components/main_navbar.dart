import 'package:flutter/material.dart';

Widget mainNavbar(BuildContext context) {
  const iconSize = 20.0;
  const iconColor = Color.fromRGBO(255, 255, 255, 0.5);
  var width = MediaQuery.of(context).size.width;
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
      width: width * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
      color: const Color(0x551e293b),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              navigate(context, '/home');
            },
            icon: const ImageIcon(
              AssetImage('icons/home.png'),
              color: iconColor,
              size: iconSize,
              semanticLabel: 'Home',
            ),
          ),
          IconButton(
            onPressed: () {
              navigate(context, '/profile');
            },
            icon: const ImageIcon(
              AssetImage('icons/profile.png'),
              color: iconColor,
              size: iconSize,
              semanticLabel: 'Profile',
            ),
          ),
          IconButton(
            onPressed: () {
              navigate(context, '/search');
            },
            icon: const ImageIcon(
              AssetImage('icons/search.png'),
              color: iconColor,
              size: iconSize,
              semanticLabel: 'Search',
            ),
          ),
          IconButton(
            onPressed: () {
              navigate(context, '/about');
            },
            icon: const ImageIcon(
              AssetImage('icons/about.png'),
              color: iconColor,
              size: iconSize,
              semanticLabel: 'About',
            ),
          ),
        ],
      ),
    ),
  );
}

void navigate(BuildContext context, String routeName) {
  if (ModalRoute.of(context)!.settings.name != routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
