import 'package:flutter/material.dart';
import 'package:neko/components/text_wrapper.dart';
import 'package:neko/layouts/home_layout.dart';
import 'package:neko/services/anilist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    AnilistService.fetcher(
      query: 'carousel',
      variables: {
        'page': 1,
        'perPage': 10,
      },
      callback: (data) {
        print(data);
      },
    );
    return homeLayout(
      context: context,
      component: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: 300,
              alignment: Alignment.center,
              child: textNormal("Home Page"),
            ),
          ],
        ),
      ),
    );
  }
}
