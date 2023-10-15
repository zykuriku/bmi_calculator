import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  BigCard({required this.colour, required this.bchild});
  final Color colour;
  final Widget bchild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: bchild,
      height: 150.0,
      width: 180.0,
      margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colour,
      ),
    );
  }
}
