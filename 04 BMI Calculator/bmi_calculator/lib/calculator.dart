import 'dart:math';

import 'package:flutter/material.dart';

class Calculator {
  final height;
  final weight;
  double bmi = 0;

  Calculator(this.height, this.weight);

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 24.9) {
      return 'Normal';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  String getAdvise() {
    if (bmi < 18.5) {
      return 'Maintain a balanced diet and seek advice from a health professional to improve your nutrition.';
    } else if (bmi < 24.9) {
      return 'Keep up your healthy habits, eat a variety of foods and maintain an exercise routine to maintain a regular weight.';
    } else if (bmi < 29.9) {
      return 'Consider exercising regularly and changing your eating habits to reduce the risk of health problems.';
    } else {
      return 'Seek support from a health professional and establish a plan to gradually lose weight and improve your overall well-being.';
    }
  }

  Color getTextColor() {
    if (bmi < 18.5) {
      return Color(0xFF0096c7);
    } else if (bmi < 24.9) {
      return Color(0xFF24D876);
    } else if (bmi < 29.9) {
      return Color(0XFFfb5607);
    } else {
      return Color(0XFFd62828);
    }
  }
}
