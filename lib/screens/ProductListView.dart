import 'package:flutter/material.dart';

import '../common_widget/AppBarWidget.dart';
import '../components/GridTilesProducts.dart';

class ProductListView extends StatelessWidget {
  final String categoryName;

  const ProductListView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(
                categoryName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Số cột trong lưới
                    childAspectRatio: 0.75, // Tỷ lệ khung hình của mỗi item
                    crossAxisSpacing: 10, // Spacing between columns
                    mainAxisSpacing: 10, // Spacing between rows
                  ),
                  itemBuilder: (context, index) {
                    return GridTilesProducts();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
