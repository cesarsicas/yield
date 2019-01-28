import 'dart:convert';

import 'package:flutter_yield/domain/check_taxes/CheckTaxesRepository.dart';
import 'package:flutter_yield/domain/check_taxes/model/selic_accumulated.dart';
import 'package:http/http.dart' as http;

class CheckTaxesRepositoryImpl extends CheckTaxesRepository {
  @override
  Future<List<SelicAccumulated>> getSelic() async {
    final url = "http://api.bcb.gov.br/dados/serie/bcdata.sgs.4390/dados?formato=json";

    final response = await http.get(url);
    final jsonValue = jsonDecode(response.body);

    final list = (jsonValue as List)
        ?.map((e) => e == null ? null : SelicAccumulated.fromJson(e as Map<String, dynamic>))
        ?.toList();

    return list;
  }
}
