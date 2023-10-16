import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF994CD3),
        ),
        scaffoldBackgroundColor: Color(0xFFD6C9EE),
      ),
      home: InputPage(),
    );
  }
}
