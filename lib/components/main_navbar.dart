import 'package:flutter/material.dart';

Widget mainNavbar(BuildContext context) {
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
          _getIcon(context, 'Home', '/home', 'icons/home.png'),
          _getIcon(context, 'Profile', '/profile', 'icons/profile.png'),
          _getIcon(context, 'Search', '/search', 'icons/search.png'),
          _getIcon(context, 'About', '/about', 'icons/about.png'),
        ],
      ),
    ),
  );
}

void _navigate(BuildContext context, String routeName) {
  if (ModalRoute.of(context)!.settings.name != routeName) {
    Navigator.pushNamed(context, routeName);
  }
}

Widget _getIcon(
  BuildContext context,
  String label,
  String route,
  String iconImage,
) {
  const iconSize = 20.0;
  const iconColor = Color(0x88e2e8f0);
  return IconButton(
    onPressed: () {
      _navigate(context, route);
    },
    icon: ImageIcon(
      AssetImage(iconImage),
      color: iconColor,
      size: iconSize,
      semanticLabel: label,
    ),
  );
}
