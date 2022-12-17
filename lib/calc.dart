import 'dart:math';
import 'package:mbi/Screens/home.dart';

class Calc {
  Calc({
    required this.height,
    required this.weight,
    required this.gender,
  });

  final int height;
  final int weight;

  final Gender gender;
  late double _bmi;
  late num _idealWeight;
  double calcBMI() {
    _bmi = weight / pow(height / 100, 2);
    return double.parse((_bmi).toStringAsFixed(1));
  }

  double calcIdealWeight() {
    if (gender == Gender.male) {
      _idealWeight = 48 + (1.1 * (height - 150));
      return double.parse((_idealWeight).toStringAsFixed(1));
    } else {
      _idealWeight = 45 + (0.9 * (height - 150));
      return double.parse((_idealWeight).toStringAsFixed(1));
    }
  }

  String getResult() {
    if (_bmi >= 30) {
      return 'obesity';
    } else if (_bmi >= 25 && _bmi < 30) {
      return 'Overweight';
    } else if (_bmi > 18.5 && _bmi < 25) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpret() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
