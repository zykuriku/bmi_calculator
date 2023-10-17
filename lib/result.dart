import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';

const resultColor = Colors.black12;

class Result extends StatelessWidget {
  Result(@required this.bmiResult, this.desc, this.resultText);

  final String bmiResult;
  final String resultText;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Result')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 500.0,
              width: 400.0,
              color: color1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      'Result Time!',
                      style: TextStyle(color: Colors.purple, fontSize: 18.0),
                    ),
                  ),
                  Text(
                    resultText,
                    style: TextStyle(
                        color: resultColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(bmiResult),
                  Text(
                    desc,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              string: 'Re-Calculate',
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
