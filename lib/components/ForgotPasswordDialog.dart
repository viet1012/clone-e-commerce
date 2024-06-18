import 'package:flutter/material.dart';

class ForgotPasswordDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Forgot Password'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Enter your email',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Bo góc
              side: const BorderSide(
                color: Colors.black, // Màu viền
                width: 1.0, // Độ dày viền
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Đóng dialog
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0XFFF67C4A7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Bo góc
              side: const BorderSide(
                color: Colors.black, // Màu viền
                width: 1.0, // Độ dày viền
              ),
            ),
          ),
          onPressed: () {
            // Xử lý gửi email reset password ở đây
            Navigator.of(context).pop(); // Đóng dialog
          },
          child: const Text(
            'Send',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
