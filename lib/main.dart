import 'package:flutter/material.dart';
import 'package:flutter_yield/screens/home.dart';
import 'package:flutter_yield/screens/splashscreen.dart';

void main() =>
    runApp(MaterialApp(home: SplashScreen(), routes: <String, WidgetBuilder>{
      "/splash_screen": (BuildContext context) => SplashScreen(),
      "/home_screen": (BuildContext context) => Home(),
      "/post_fixed_cdb_screen": (BuildContext context) => Home(),
    }));
