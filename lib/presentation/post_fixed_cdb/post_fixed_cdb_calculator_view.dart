import 'package:flutter_yield/domain/post_fixed_cdb/model/post_fixed_cdb_result.dart';

abstract class PostFixedCDBCalculatorView {
  void onResult(PostFixedCdbResult result);

  void showMessage(String message);
}
