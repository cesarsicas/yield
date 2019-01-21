import 'package:flutter_yield/domain/post_fixed_cdb/post_fixed_cdb_use_cases.dart';
import 'package:flutter_yield/presentation/post_fixed_cdb/post_fixed_cdb_calculator_view.dart';

class PostFixedCDBCalculatorPresenter {
  final useCase = PostFixedCDBUseCases();
  PostFixedCDBCalculatorView view;

  PostFixedCDBCalculatorPresenter(PostFixedCDBCalculatorView view) {
    this.view = view;
  }

  calculatePostFixedCDB(
      String principal, String months, String actualCdi, String offeredTax) {
    try {
      final result = useCase.calculatePostFixedCDB(
          double.tryParse(principal),
          int.tryParse(months),
          double.tryParse(actualCdi),
          double.tryParse(offeredTax));

      view.onResult(result);
    } catch (e) {
      view.showMessage("Ocorreu um erro");
    }
  }
}
