import 'package:flutter/material.dart';

class ShoppingCartIcon extends StatelessWidget {
  final int itemCount;
  final VoidCallback onTap;
  const ShoppingCartIcon(
      {super.key, required this.itemCount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    String displayCount = itemCount > 99 ? '99+' : itemCount.toString();

    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          const Icon(
            Icons.shopping_cart,
            size: 30,
          ),
          if (itemCount > 0) // Hiển thị chỉ khi có hơn 0 sản phẩm
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                constraints: const BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: Text(
                  displayCount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
