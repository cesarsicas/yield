import 'package:flutter_yield/domain/home/investment_option_model.dart';

class HomePresenter {
  List<InvestmentOptionModel> getInvestmentTypes() {
    List<InvestmentOptionModel> list = List<InvestmentOptionModel>();

    list.add(InvestmentOptionModel("/post_fixed_cdb", "CDB Pós Fixado"));
    list.add(InvestmentOptionModel("", "CDB Pré Fixado"));
    list.add(InvestmentOptionModel("", "CDB Tesouro Direto"));
    list.add(InvestmentOptionModel("", "LCI/LCA"));

    return list;
  }
}
