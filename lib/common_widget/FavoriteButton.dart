import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: isFavorite ? Colors.red : Color(0xFFD5D3D3),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
          size: 35,
          color: isFavorite ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
