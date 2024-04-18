import 'package:flutter/material.dart';
import 'package:neko/layouts/home_layout.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return homeLayout(
      context,
      Container(
        width: width,
        height: 300,
        alignment: Alignment.center,
        child: const Text(
          "Setting Page",
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
