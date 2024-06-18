import 'package:flutter/material.dart';

class DeliveryOptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final VoidCallback onTap;
  final bool isSelected; // Trạng thái đã chọn của tile

  const DeliveryOptionTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xFF67C4A7) : const Color(0xC7E0E0E0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Text(
              price,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
