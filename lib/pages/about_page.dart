import 'package:flutter/material.dart';
import 'package:neko/components/text_wrapper.dart';
import 'package:neko/layouts/home_layout.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return homeLayout(
      context: context,
      component: Container(
        width: width,
        height: 300,
        alignment: Alignment.center,
        child: textNormal("About Page"),
      ),
    );
  }
}
