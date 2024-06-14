import 'package:flutter/material.dart';

import '../components/CategoryRow.dart';
import '../models/Category.dart';

class CategoryListScreen extends StatelessWidget {
  final List<Category> categories = [
    Category(name: 'Apparel', imageUrl: 'assets/images/categories/Group 8.png'),
    Category(
        name: 'School', imageUrl: 'assets/images/categories/Group 8 (1).png'),
    Category(
        name: 'Sport', imageUrl: 'assets/images/categories/Group 8 (2).png'),
    Category(
        name: 'Electronic 2',
        imageUrl: 'assets/images/categories/Group 8 (3).png'),
    Category(name: 'All', imageUrl: 'assets/images/categories/Group 8 (4).png'),
  ];

  CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Category",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          CategoryRow(categories: categories),
        ],
      ),
    );
  }
}
