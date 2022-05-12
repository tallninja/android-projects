import 'dart:math';

class BMICalculator {
  final int height;
  final int weight;
  late double _bmi;

  BMICalculator({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return (_bmi).toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretetion() {
    if (_bmi >= 25) {
      return 'Your BMI is high perhaps you should consider reducing the amount of food you take and working out more.';
    } else if (_bmi > 18.5) {
      return 'Your BMI is normal. Great job keep up the good work.';
    } else {
      return 'Your BMI is high perhaps you should consider increasing the amount of food you take.';
    }
  }
}
