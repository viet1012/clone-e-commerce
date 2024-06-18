import 'package:flutter/material.dart';

import '../components/DeliveryOptions.dart';
import '../components/ProductInformationSection.dart';
import '../models/Product.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
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
  String selectedDeliveryOption = '';
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

  void _showDeliveryOptions() async {
    final selectedOption = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => DeliveryOptions(),
    );

    if (selectedOption != null) {
      setState(() {
        selectedDeliveryOption = selectedOption;
      });
    }
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
        title: const Text(
          "Check out",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Column(
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
                  isCheckout: true,
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
          Column(
            children: [
              const Text(
                "Hide list",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF67C4A7),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    _showDeliveryOptions();
                  },
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDeliveryOption.isNotEmpty
                              ? selectedDeliveryOption
                              : 'Select Delivery Option',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_downward,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
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
                        color: anyProductSelected ? Colors.white : Colors.black,
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
