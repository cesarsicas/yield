import 'dart:convert';

import 'package:flutter_yield/domain/check_taxes/model/selic_accumulated.dart';
import 'package:flutter_yield/presentation/check_taxes/check_taxes_view.dart';
import 'package:http/http.dart' as http;

class CheckTaxesPresenter {
  CheckTaxesView view;

  CheckTaxesPresenter(CheckTaxesView view) {
    this.view = view;
  }

  getTaxes(){
    getSelic();

  }

  getSelic()  async{
    var url =
        "http://api.bcb.gov.br/dados/serie/bcdata.sgs.4390/dados?formato=json";

    http.get(url).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      var jsonValue = jsonDecode(response.body);

      var list = (jsonValue as List)
          ?.map((e) => e == null
              ? null
              : SelicAccumulated.fromJson(e as Map<String, dynamic>))
          ?.toList();

      view?.setSelicValue(list.last);
    });
  }
}
