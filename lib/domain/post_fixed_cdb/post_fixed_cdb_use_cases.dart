import 'dart:math';

import 'package:flutter_yield/domain/post_fixed_cdb/model/post_fixed_cdb_calc.dart';

class PostFixedCDBUseCases {
  PostFixedCDBUseCases();

//  double calculatePostFixedCDB(double p, int t, double annualCdi, double offeredRate) {
//    final i = (offeredRate / 100.0) * (annualCdi/12.0);
//    return _calculateCompoundRate(p, t, i / 100.0);
//  }

  double calculatePostFixedCDB(PostFixedCdbCalc postFixedCdb) {
    final i =
        (postFixedCdb.rateOfReturn / 100.0) * (postFixedCdb.annualCdi / 12.0);

    return _calculateCompoundRate(
        postFixedCdb.startValue, postFixedCdb.timeInMonths, i / 100.0);
  }

  double _calculateCompoundRate(double p, int t, double i) {
    //M = P . (1 +  i)n
    return p * pow((1 + i), t);
  }
}
