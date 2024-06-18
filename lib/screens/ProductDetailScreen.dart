import 'package:clone_e_commerce/screens/ShoppingCartScreen.dart';
import 'package:flutter/material.dart';

import '../common_widget/FavoriteButton.dart';
import '../common_widget/ShoppingCartIcon.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop(); // Quay lại màn hình trước đó
          },
        ),
        title: const Center(
          child: Text(
            "Details Product",
            style: TextStyle(fontSize: 20),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ShoppingCartIcon(
              itemCount: 2,
              onTap: () {},
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity, // Chiếm toàn bộ chiều rộng
        // color: Colors.pinkAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/product_details/imgslider.png",
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Air pods max by Apple",
                      style: TextStyle(
                        color: Color(0xFF393F42),
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "\$ 1999,99",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF393F42),
                            ),
                          ),
                          TextSpan(
                            text: " ( 219 people buy this )",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff393F42),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const FavoriteButton(),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Choose the color",
              style: TextStyle(
                color: Color(0xFF939393),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 70,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.primaries[index * 2],
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xb7b1b1ff),
                    width: 1.0,
                  ),
                  bottom: BorderSide(
                    color: Color(0xb7b1b1ff),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/suppliers/Rectangle 16.png"),
                      const SizedBox(width: 10),
                      const Text(
                        "Apple Store ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      print("Button clicked!");
                    },
                    child: Container(
                      width: 110,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Center(
                        child: Text(
                          "Follow",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Description of product",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis, // Cắt ngắn với dấu ba chấm
                maxLines: 4, // Giới hạn số dòng
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingCartScreen(),
                        ),
                      );
                      print("Button clicked!");
                    },
                    child: Container(
                      width: 140,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xFF67C4A7),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      print("Button clicked!");
                    },
                    child: Container(
                      width: 140,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xB9C4C4C4),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
