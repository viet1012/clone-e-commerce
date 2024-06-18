import 'package:flutter/material.dart';

import '../common_widget/AnimatedLogo.dart';
import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool _visible; // Biến để điều khiển hiển thị của Splash Screen

  @override
  void initState() {
    super.initState();
    _visible = false;

    // Đợi 2 giây rồi bắt đầu hiển thị fade in
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _visible = true;
      });

      // Sau 5 giây, chuyển sang màn hình Login
      Future.delayed(Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(seconds: 2), // Thời gian fade in
          curve: Curves.easeIn,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedLogo(
                width: 200,
                height: 200,
              ), // Đây có thể là logo hoặc hình ảnh khác của bạn
              SizedBox(height: 20),
              Text(
                'Welcome to V',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
