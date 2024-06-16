import 'package:clone_e_commerce/screens/ProductDetailScreen.dart';
import 'package:flutter/material.dart';

class GridTilesProducts extends StatelessWidget {
  const GridTilesProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductDetailScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black, // Màu viền
            width: 1.0, // Độ dày viền
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "assets/images/products/img.png", // URL ảnh placeholder
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Monitor LG 22”inc 4K 120Fps",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF444444),
                    fontFamily: 'Roboto-Light',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: const Text(
                  "1999.99",
                  style: TextStyle(
                    color: Color(0xFFf67426),
                    fontFamily: 'Roboto-Light',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFFF67C4A7), // Màu nền của nút
                  foregroundColor: Colors.white, // Màu chữ của nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Bo góc
                    side: const BorderSide(
                      color: Colors.black, // Màu viền
                      width: 1.0, // Độ dày viền
                    ),
                  ),
                  minimumSize:
                      const Size(150, 40), // Kích thước tối thiểu của nút
                ),
                onPressed: () {
                  print("Button pressed");
                },
                child: const Text(
                  "Add to cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto-Light',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
