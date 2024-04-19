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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return _createRoute(const HomePage());
          case '/trending':
            return _createRoute(const TrendingPage());
          case '/profile':
            return _createRoute(const ProfilePage());
          case '/setting':
            return _createRoute(const SettingPage());
          default:
            return null;
        }
      },
    );
  }
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.easeInOutQuart;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
