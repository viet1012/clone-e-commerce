import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.grey[600],
        ),
        child: TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            prefixIcon: Icon(Icons.search),
            fillColor: const Color(0xFFF2F4F5),
            hintStyle: new TextStyle(color: Colors.grey[600]),
            hintText: "Search here...?",
          ),
          autofocus: false,
        ),
      ),
    );
  }
}
