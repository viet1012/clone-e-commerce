import 'package:flutter/material.dart';

class QuantityAdjuster extends StatefulWidget {
  final int initialQuantity;

  QuantityAdjuster({Key? key, required this.initialQuantity}) : super(key: key);

  @override
  _QuantityAdjusterState createState() => _QuantityAdjusterState();
}

class _QuantityAdjusterState extends State<QuantityAdjuster> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      if (_quantity > 99) {
        _quantity = 99;
      }
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildQuantityButton(Icons.remove, _decrementQuantity),
        SizedBox(
          width: 30,
          child: Text(
            '$_quantity',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        _buildQuantityButton(Icons.add, _incrementQuantity),
        _buildQuantityButton(Icons.delete, _decrementQuantity),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
