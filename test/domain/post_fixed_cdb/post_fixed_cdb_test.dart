import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_yield/domain/post_fixed_cdb/post_fixed_cdb_use_cases.dart';

void main() {

  test('should pass', () {
    var calculator = PostFixedCDBUseCases();
    var result = calculator.calculatePostFixedCDB(6000, 12, (3.5*12.0), 100.00);
    expect(result, closeTo(9066.41, 0.01));
  });

}
