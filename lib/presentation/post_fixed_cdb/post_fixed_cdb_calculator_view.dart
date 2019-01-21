import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yield/presentation/post_fixed_cdb/post_fixed_cdb_calculator_presenter.dart';
import 'package:flutter_yield/presentation/post_fixed_cdb/result/post_fixed_cdb_result_screen.dart';

abstract class  PostFixedCDBCalculatorView {
  void onResult(double result);
  void showMessage(String message);
}
