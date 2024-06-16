import 'dart:async';

import 'package:flutter/material.dart';

class BannerList extends StatefulWidget {
  final List<String> banners = [
    'assets/images/banners/banner 1.png', // Replace with your image URLs
    'assets/images/banners/banner 1.png',
    'assets/images/banners/banner 1.png',
  ];
  @override
  State<BannerList> createState() => _BannerListState();
}

class _BannerListState extends State<BannerList> {
  PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);

  int _currentPage = 0;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startSlider();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startSlider() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < widget.banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Adjust the height as needed
      child: PageView.builder(
        itemCount: widget.banners.length,
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return BannerItem(imageUrl: widget.banners[index]);
        },
      ),
    );
  }
}

class BannerItem extends StatelessWidget {
  final String imageUrl;

  const BannerItem({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330, // Adjust the width as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
