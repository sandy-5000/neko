import 'package:flutter/material.dart';
import 'package:neko/layouts/home_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          "Home Page",
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