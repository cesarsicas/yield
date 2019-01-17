import 'package:flutter/material.dart';
import 'package:flutter_yield/investment_option.dart';
import 'package:flutter_yield/post_fixed_cdb_calculator.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final items = getInvestmentTypes();

    return MaterialApp(
      title: 'Calculate your Yeld',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Choose an Investment Type"),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index].title}'),
              onTap: () => router(context, items[index].id),
            );
          },
        ),
      ),
    );
  }

  List<InvestmentOption> getInvestmentTypes() {
    List<InvestmentOption> list = List<InvestmentOption>();
    list.add(InvestmentOption(0, "CDB Pós Fixado"));
    list.add(InvestmentOption(1, "CDB Pré Fixado"));
    list.add(InvestmentOption(2, "CDB Tesouro Direto"));
    list.add(InvestmentOption(3, "LCI/LCA"));

    return list;
  }

  void router(BuildContext context, int id) {
    var page;

    switch (id) {
      case 0:
        page = PostFixedCDBCalculator();
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }

    if (page != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    } else {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: Text("Todo this someday"),
      ));
    }
  }
}