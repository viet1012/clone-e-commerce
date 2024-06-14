import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: const Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery address',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'Salatiga City, Central Java',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              color: Colors.black,
              iconSize: 30,
              onPressed: () {
                // Xử lý khi nhấn nút giỏ hàng
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
              ),
              color: Colors.black,
              iconSize: 30,
              onPressed: () {
                // Xử lý khi nhấn nút thông báo
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
