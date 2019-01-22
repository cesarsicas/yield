import 'package:flutter_yield/domain/post_fixed_cdb/model/post_fixed_cdb_calc.dart';

class PostFixedCdbResult {
  PostFixedCdbCalc calc;
  double result;

  PostFixedCdbResult(PostFixedCdbCalc calc, double result) {
    this.calc = calc;
    this.result = result;
  }
}
