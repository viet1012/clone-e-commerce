import 'package:flutter/material.dart';

import '../models/Category.dart';
import 'CategoryItem.dart';

class CategoryRow extends StatelessWidget {
  final List<Category> categories;

  const CategoryRow({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CategoryItem(category: categories[index]),
          );
        },
      ),
    );
  }
}
