import 'dart:async';
import 'package:flutter/material.dart';
import 'package:neko/components/text_wrapper.dart';
import 'package:neko/layouts/home_layout.dart';
import 'package:neko/services/anilist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

Timer? _timer;

class _HomePageState extends State<HomePage> {
  dynamic carousel;
  int _currentPage = 0;

  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.85,
  );

  _HomePageState() {
    _currentPage = 0;
    _pageController.addListener(() {
      int next = (_pageController.page ?? 0).round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  Widget _getCarouselImages(dynamic carousel) {
    return PageView.builder(
      controller: _pageController,
      itemCount: carousel.length,
      itemBuilder: (context, index) {
        return carouselImage(
          imagePath: carousel[index]['coverImage']['extraLarge'],
          active: index == _currentPage,
        );
      },
    );
  }

  void startTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.page == carousel.length - 1) {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.decelerate,
        );
      } else {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 600),
          curve: Curves.decelerate,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    AnilistService.fetcher(
      query: 'carousel',
      variables: {
        'page': 1,
        'perPage': 10,
      },
      callback: (data) {
        setState(() {
          carousel = data?['data']['Page']['media'];
          startTimer();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return homeLayout(
      context: context,
      component: SingleChildScrollView(
        child: Column(
          children: [
            carousel == null
                ? Container()
                : SizedBox(
                    width: double.infinity,
                    height: width,
                    child: _getCarouselImages(carousel),
                  ),
          ],
        ),
      ),
    );
  }
}

Widget carouselImage({imagePath, active}) {
  final double blur = active ? 30 : 0;
  final double offset = active ? 20 : 0;
  final double top = active ? 50 : 70;
  final double bottom = active ? 5 : 15;
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    curve: Curves.decelerate,
    margin: EdgeInsets.only(top: top, bottom: bottom, left: 10, right: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(
        scale: active ? 1.2 : 1.0,
        fit: BoxFit.cover,
        image: NetworkImage(imagePath),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.white10,
          blurRadius: blur,
          offset: Offset(offset, offset),
        )
      ],
    ),
  );
}
