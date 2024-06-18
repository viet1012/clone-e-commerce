import 'package:flutter/material.dart';

import '../common_widget/AnimatedLogo.dart';
import '../components/ProductInformationSection.dart';
import '../models/Product.dart';
import 'CheckoutScreen.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<Product> products = [
    Product(
      name: 'Air Pods Max by Apple',
      variant: 'Grey',
      price: 1999.9,
      quantity: 1,
      imageUrl: 'assets/images/products/img.png',
    ),
    Product(
      name: 'Air Pods Max by Apple',
      variant: 'Grey',
      price: 1999.9,
      quantity: 1,
      imageUrl: 'assets/images/products/img.png',
    ),
  ];
  late List<bool> selectedStates;

  @override
  void initState() {
    super.initState();
    // Khởi tạo danh sách selectedStates với kích thước bằng số lượng sản phẩm
    selectedStates = List<bool>.filled(products.length, false);
  }

  void _handleSelectionChanged(int index, bool isSelected) {
    setState(() {
      selectedStates[index] = isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final anyProductSelected = selectedStates.contains(true);
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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Cart",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            SizedBox(width: 10),
            AnimatedLogo(
              width: 40,
              height: 40,
            ),
          ],
        ),
        // actions: <Widget>[
        //   Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: const AnimatedLogo(
        //       width: 40,
        //       height: 40,
        //     ),
        //   ),
        // ],
      ),
      body: products.length == 0
          ? Column(
              children: [
                Image.asset(
                  "assets/images/cart/empty_shopping_cart.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  child: Text(
                    "You haven't anything to cart",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Delivery to",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Nguyen Trai, Quan 5, TpHCM",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Xử lý khi nhấn nút thông báo
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                            ),
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    scrollDirection: Axis.vertical,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductInformationSection(
                        isCheckout: false,
                        screenWidth: screenWidth,
                        productName: products[index].name,
                        productVariant: products[index].variant,
                        productPrice: products[index].price,
                        quantity: products[index].quantity,
                        imageUrl: products[index].imageUrl,
                        onSelectionChanged: (isSelected) {
                          _handleSelectionChanged(index, isSelected);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Totals",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "\$ 00,0",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      OutlinedButton(
                        onPressed: () {
                          if (anyProductSelected) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutScreen(),
                              ),
                            );
                          } else {
                            print("object");
                          }
                          // Xử lý sự kiện khi nhấn nút
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: anyProductSelected
                              ? const Color(0xFF67C4A7)
                              : const Color(0xB9C4C4C4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Đặt độ cong của góc thành 8.0
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          child: Text(
                            anyProductSelected
                                ? "Select payment method"
                                : "Continue for payments",
                            style: TextStyle(
                              color: anyProductSelected
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10)
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
