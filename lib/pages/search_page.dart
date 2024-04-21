import 'package:flutter/material.dart';
import 'package:neko/components/text_wrapper.dart';
import 'package:neko/layouts/home_layout.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return homeLayout(
      context: context,
      component: Container(
        width: width,
        height: 300,
        alignment: Alignment.center,
        child: textNormal("Search Page"),
      ),
    );
  }
}
