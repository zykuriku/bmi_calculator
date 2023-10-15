import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  SmallCard(
      {required this.colour, required this.schild, required this.onPress});
  final Color colour;
  final Widget schild;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: schild,
        height: 120.0,
        width: 100.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: colour,
        ),
      ),
    );
  }
}
