import 'package:flutter/material.dart';
import 'package:flutter_yield/domain/check_taxes/model/selic_accumulated.dart';
import 'package:flutter_yield/presentation/check_taxes/check_taxes_presenter.dart';
import 'package:flutter_yield/presentation/check_taxes/check_taxes_view.dart';

class CheckTaxesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CheckTaxesScreenState();
}

class _CheckTaxesScreenState extends State<CheckTaxesScreen>
    implements CheckTaxesView {
  CheckTaxesPresenter presenter;
  var selicValue = "0.0";
  var selicDate = "00/00/00";
  var selicOneYear = "0.0";

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => presenter.getSelic());

    presenter = CheckTaxesPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Taxas atuais"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Selic Acumulada do mês: ", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(selicValue)
              ],
            ),
            Row(
              children: <Widget>[
                Text("Data Selic acumulada: ",  style: TextStyle(fontWeight: FontWeight.bold)),
                Text(selicDate)
              ],
            ),

            Row(
              children: <Widget>[
                Text("Selic Acumulada (1 ano): ",  style: TextStyle(fontWeight: FontWeight.bold)),
                Text(selicOneYear)
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  setSelicValue(SelicAccumulated selic, double selicOneYearAccummulated) {
    setState(() {
      selicValue = selic.value;
      selicDate = selic.date;
      selicOneYear = selicOneYearAccummulated.toStringAsPrecision(2);
    });
  }
}
