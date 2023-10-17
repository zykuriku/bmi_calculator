import 'dart:math';

class Calculate {
  Calculate({required this.height, required this.weight});
  final int height;
  final int weight;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getDesc() {
    if (_bmi >= 25) {
      return 'You have a higher body mass index which may lead to health problems. Try to eat healthy and exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a perfectly normal body mass index. Good going!';
    } else {
      return 'You have a lower body mass index which may lead to health problems. Try to eat healthy and gain more mass.';
    }
  }
}
