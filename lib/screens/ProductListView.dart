import 'package:flutter/material.dart';

import '../common_widget/ShoppingCartIcon.dart';
import '../components/GridTilesProducts.dart';
import 'ShoppingCartScreen.dart';

class ProductListView extends StatefulWidget {
  final String categoryName;

  const ProductListView({super.key, required this.categoryName});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(
      begin: const Color(0XFFF67C4A7),
      end: Colors.white,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: SizedBox(
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              prefixIcon: const Icon(Icons.search),
              fillColor: const Color(0xFFF2F4F5),
              hintStyle: new TextStyle(color: Colors.grey[600]),
              hintText: "Search here...?",
            ),
            autofocus: false,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ShoppingCartIcon(
                itemCount: 2,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoppingCartScreen(),
                    ),
                  );
                }),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border(
                      top: BorderSide(
                        color: _colorAnimation.value!,
                        width: 3,
                      ),
                      bottom: BorderSide(
                        color: _colorAnimation.value!,
                        width: 1,
                      ),
                      left: BorderSide(
                        color: _colorAnimation.value!,
                      ),
                      right: BorderSide(
                        color: _colorAnimation.value!,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    widget.categoryName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
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
