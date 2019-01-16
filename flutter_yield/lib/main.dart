import 'package:flutter/material.dart';
import 'package:flutter_yield/yield_calculator.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculate your income', home: YieldCalculator());
  }
}
