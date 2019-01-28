
import 'package:flutter_yield/domain/check_taxes/model/selic_accumulated.dart';

abstract class CheckTaxesRepository{
  Future<List<SelicAccumulated>> getSelic();
}