import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  final String text;
  ListHeader({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[850],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Text(
          "$text",
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}