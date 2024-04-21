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

final PageController _pageController = PageController(initialPage: 0);
Timer? _timer;

class _HomePageState extends State<HomePage> {
  dynamic carousel;

  Widget _getCarouselImages(dynamic carousel) {
    return PageView.builder(
      controller: _pageController,
      itemCount: carousel.length,
      itemBuilder: (context, index) {
        return _CarouselImage(
          imagePath: carousel[index]['coverImage']['extraLarge'],
        );
      },
    );
  }

  void startTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (_pageController.page == carousel.length - 1) {
        _pageController.animateToPage(
          0,
          duration: const Duration(microseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.nextPage(
          duration: const Duration(microseconds: 300),
          curve: Curves.easeInOut,
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
          carousel = data?['data']?['Page']?['media'];
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

class _CarouselImage extends StatelessWidget {
  final String imagePath;
  const _CarouselImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      fit: BoxFit.cover,
    );
  }
}
