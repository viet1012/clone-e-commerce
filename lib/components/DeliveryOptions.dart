import 'package:flutter/material.dart';

import '../common_widget/DeliveryOptionTile.dart';

class DeliveryOptions extends StatefulWidget {
  @override
  State<DeliveryOptions> createState() => _DeliveryOptionsState();
}

class _DeliveryOptionsState extends State<DeliveryOptions> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Select the delivery',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close_rounded),
                color: Colors.black,
              ),
            ],
          ),
          const Divider(),
          DeliveryOptionTile(
            title: 'Express',
            subtitle: '1 - 3 days delivery',
            price: '\$14,99',
            onTap: () {
              _handleOptionSelected('Express');
            },
            isSelected: selectedOption == 'Express',
          ),
          DeliveryOptionTile(
            title: 'Regular',
            subtitle: '2 - 4 days delivery',
            price: '\$7,99',
            onTap: () {
              _handleOptionSelected('Regular');
            },
            isSelected: selectedOption == 'Regular',
          ),
          DeliveryOptionTile(
            title: 'Cargo',
            subtitle: '7 - 14 days delivery',
            price: '\$2,99',
            onTap: () {
              _handleOptionSelected('Cargo');
            },
            isSelected: selectedOption == 'Cargo',
          ),
        ],
      ),
    );
  }

  void _handleOptionSelected(String option) {
    setState(() {
      selectedOption = option; // Cập nhật option được chọn
    });
    Navigator.pop(
        context, option); // Đóng bottom sheet và trả về option đã chọn
  }
}
