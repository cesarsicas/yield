import 'package:flutter/material.dart';
import 'package:flutter_yield/presentation/check_taxes/check_taxes_screen.dart';
import 'package:flutter_yield/presentation/home/home_screen.dart';
import 'package:flutter_yield/presentation/post_fixed_cdb/post_fixed_cdb_calculator_screen.dart';
import 'package:flutter_yield/presentation/splashscreen/splashscreen.dart';

void main() =>
    runApp(MaterialApp(home: SplashScreen(), routes: <String, WidgetBuilder>{
      "/splash": (BuildContext context) => SplashScreen(),
      "/home": (BuildContext context) => HomeScreen(),
      "/check_taxes":(BuildContext context) => CheckTaxesScreen(),
      "/post_fixed_cdb": (BuildContext context) =>
          PostFixedCDBCalculatorScreen(),
    }));
