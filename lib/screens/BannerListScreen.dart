import 'package:flutter/material.dart';

class BannerList extends StatelessWidget {
  final List<String> banners = [
    'assets/images/banners/banner 1.png', // Replace with your image URLs
    'assets/images/banners/banner 1.png',
    'assets/images/banners/banner 1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // Adjust the height as needed
      child: ListView.builder(
        itemCount: banners.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: BannerItem(imageUrl: banners[index]),
          );
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
