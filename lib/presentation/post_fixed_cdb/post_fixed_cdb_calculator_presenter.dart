import 'package:flutter_yield/domain/post_fixed_cdb/model/post_fixed_cdb_calc.dart';
import 'package:flutter_yield/domain/post_fixed_cdb/model/post_fixed_cdb_result.dart';
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

      final postFixedCdbCalc =
          PostFixedCdbCalc(stringToDouble(principal), int.tryParse(months), stringToDouble(actualCdi), stringToDouble(offeredTax));

      final result = useCase.calculatePostFixedCDB(postFixedCdbCalc);

      view.onResult(PostFixedCdbResult(postFixedCdbCalc, result));

    } catch (e) {
      view.showMessage("Ocorreu um erro");
    }
  }

  double stringToDouble(String str){
    return double.tryParse(str.replaceAll(",", "."));
  }
}
