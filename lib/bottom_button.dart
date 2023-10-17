import 'package:flutter/material.dart';
import 'input_page.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.string, required this.onTap});

  final VoidCallback onTap;
  final String string;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Center(
            child: Text(
          string,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        )),
        onPressed: onTap,
      ),
      margin: EdgeInsets.all(5.0),
      // color: Color(0xFF994CD3),
      height: bottomCheight,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(0xFF994CD3),
      ),
    );
  }
}
