import 'package:flutter/material.dart';
import 'package:neko/components/text_wrapper.dart';
import 'package:neko/layouts/home_layout.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return homeLayout(
      context: context,
      component: Container(
        width: width,
        height: 300,
        alignment: Alignment.center,
        child: textNormal("Profile Page"),
      ),
    );
  }
}
