import 'package:clone_e_commerce/screens/ProductListView.dart';
import 'package:flutter/material.dart';

import '../models/Category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Điều hướng đến màn hình mới khi nhấn vào 'All'
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductListView(
              categoryName: category.name,
            ), // Thay NewScreen bằng màn hình bạn muốn chuyển đến
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 58,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(category.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
