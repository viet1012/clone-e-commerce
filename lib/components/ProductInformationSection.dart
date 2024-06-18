import 'package:flutter/material.dart';

import '../common_widget/QuantityAdjuster.dart';

class ProductInformationSection extends StatefulWidget {
  final double screenWidth; // Screen width for responsive design
  final String productName;
  final String productVariant;
  final String imageUrl;
  final double productPrice;
  final int quantity;
  final ValueChanged<bool> onSelectionChanged;
  final bool isCheckout;

  const ProductInformationSection({
    required this.screenWidth,
    required this.productName,
    required this.productVariant,
    required this.productPrice,
    required this.quantity,
    required this.imageUrl,
    required this.onSelectionChanged,
    required this.isCheckout,
  });

  @override
  State<ProductInformationSection> createState() =>
      _ProductInformationSectionState();
}

class _ProductInformationSectionState extends State<ProductInformationSection> {
  bool isSelected = false;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
    widget.onSelectionChanged(isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: widget.screenWidth,
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
      child: Container(
        padding: const EdgeInsets.only(left: 4, top: 0, right: 0, bottom: 0),
        child: Row(
          children: [
            widget.isCheckout == false
                ? GestureDetector(
                    onTap: _toggleSelection,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color:
                            isSelected ? const Color(0xFF67C4A7) : Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20,
                            )
                          : null,
                    ),
                  )
                : SizedBox(),
            const SizedBox(width: 4),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Variant: ${widget.productVariant}",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          child: Row(
                            children: [
                              Text(
                                "\$ ${widget.productPrice}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10),
                              widget.isCheckout == false
                                  ? QuantityAdjuster(
                                      initialQuantity: widget.quantity)
                                  : SizedBox(
                                      width: 140,
                                      child: Text(
                                        textAlign: TextAlign.right,
                                        "1 quantity",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
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
