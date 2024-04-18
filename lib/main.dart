import 'package:flutter/material.dart';
import 'package:neko/pages/home_page.dart';
import 'package:neko/pages/profile_page.dart';
import 'package:neko/pages/setting_page.dart';
import 'package:neko/pages/trending_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/trending': (context) => const TrendingPage(),
        '/profile': (context) => const ProfilePage(),
        '/setting': (context) => const SettingPage(),
      },
    );
  }
}
