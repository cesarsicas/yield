import 'package:flutter_yield/data/check_taxes/CheckTaxesRepositoryImpl.dart';
import 'package:flutter_yield/domain/check_taxes/CheckTaxesRepository.dart';
import 'package:flutter_yield/domain/check_taxes/model/selic_accumulated.dart';
import 'package:flutter_yield/presentation/check_taxes/check_taxes_view.dart';

class CheckTaxesPresenter {
  CheckTaxesView view;
  CheckTaxesRepository repository;

  CheckTaxesPresenter(CheckTaxesView view) {
    this.view = view;
    this.repository = CheckTaxesRepositoryImpl();
  }

  getTaxes() {
    getSelic();
  }

  getSelic() {
    double selicOneYear = 0.0;
    List<SelicAccumulated> newList;

    repository.getSelic().then((list) {
      if (list.length >= 12) {
        newList = list.sublist(list.length - 13, list.length - 1);

        newList.forEach((item) {
          var value = double.parse(item.value);
          selicOneYear += value;
        });
      }
      view.setSelicValue(list.last, selicOneYear);
    });
  }
}
