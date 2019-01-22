import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_yield/domain/post_fixed_cdb/model/post_fixed_cdb_calc.dart';
import 'package:flutter_yield/domain/post_fixed_cdb/post_fixed_cdb_use_cases.dart';

void main() {
  test('should pass', () {
    final calculator = PostFixedCDBUseCases();
    final postFixedCdb = PostFixedCdbCalc(6000, 12, (3.5 * 12.0), 100.00);
    final result =
        calculator.calculatePostFixedCDB(postFixedCdb);
    expect(result, closeTo(9066.41, 0.01));
  });
}
