import 'dart:math';

class CalculateBmiResult {
  final int height;
  final int weight;
  double _bmi = 0.0;

  CalculateBmiResult({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiTextResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return "normal";
    } else {
      return "Overweight";
    }
  }

  String getBmiRule() {
    if (_bmi >= 25) {
      return 'Overweight is if BMI >= 25 kg/m^2';
    } else if (_bmi > 18.5) {
      return "Normal is if BMI  = 18.5–24.9 kg/m^2";
    } else {
      return "Underweight is if BMI = <18.5 kg/m^2";
    }
  }

  String getComment() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to excercise more \n ';
    } else if (_bmi > 18.5) {
      return "Amazing buddy! You have a normal BMI weight \n ";
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more. \n ';
    }
  }
}
