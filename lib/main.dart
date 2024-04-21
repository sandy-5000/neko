import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:neko/pages/home_page.dart';
import 'package:neko/pages/profile_page.dart';
import 'package:neko/pages/about_page.dart';
import 'package:neko/pages/search_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('data_cache');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
      ),
      home: const HomePage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return _createRoute(const HomePage());
          case '/search':
            return _createRoute(const SearchPage());
          case '/profile':
            return _createRoute(const ProfilePage());
          case '/about':
            return _createRoute(const AboutPage());
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
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.easeInQuart;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
