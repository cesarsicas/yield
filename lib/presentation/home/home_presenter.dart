import 'package:flutter_yield/domain/home/model/investment_option_model.dart';

class HomePresenter {
  List<InvestmentOptionModel> getInvestmentTypes() {
    List<InvestmentOptionModel> list = List<InvestmentOptionModel>();

    list.add(InvestmentOptionModel("/post_fixed_cdb", "CDB Pós Fixado"));
    list.add(InvestmentOptionModel("", "CDB Pré Fixado"));
    list.add(InvestmentOptionModel("", "CDB Tesouro Direto"));
    list.add(InvestmentOptionModel("", "LCI/LCA"));
    list.add(InvestmentOptionModel("/check_taxes", "Check Today's Selic and CDI "));

    return list;
  }
}
