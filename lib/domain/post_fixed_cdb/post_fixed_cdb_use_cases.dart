import 'dart:math';

class PostFixedCDBUseCases {
  PostFixedCDBUseCases();

  double calculatePostFixedCDB(
      double p, int t, double annualCdi, double offeredRate) {
    final i = (offeredRate / 100.0) * annualCdi;

    return _calculateCompoundRate(p, t, i / 100.0);
  }

  double _calculateCompoundRate(double p, int t, double i) {
    //M = P . (1 +  i)n
    return p * pow((1 + i), t);
  }
}
