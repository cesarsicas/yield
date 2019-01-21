import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yield/presentation/post_fixed_cdb/post_fixed_cdb_calculator_presenter.dart';
import 'package:flutter_yield/presentation/post_fixed_cdb/post_fixed_cdb_calculator_view.dart';

class PostFixedCDBCalculatorScreen extends StatelessWidget
    implements PostFixedCDBCalculatorView {
  BuildContext context;
  PostFixedCDBCalculatorPresenter presenter;
  final mainValueEditController = TextEditingController();
  final timeEditController = TextEditingController();
  final actualCDIEditController = TextEditingController();
  final offeredRateEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    this.context = context;
    this.presenter = PostFixedCDBCalculatorPresenter(this);

    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora CDB Pós Fixado"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: new ListView(
                  children: <Widget>[
                    TextFormField(
                      controller: actualCDIEditController,
                      decoration:
                          InputDecoration(labelText: 'CDI Atual (% / Ao ano)'),
                    ),
                    TextFormField(
                      controller: offeredRateEditController,
                      decoration:
                          InputDecoration(labelText: 'Taxa oferecida CDI (%)'),
                    ),
                    TextFormField(
                      controller: mainValueEditController,
                      decoration: InputDecoration(
                          labelText: 'Valor Aplicado (R\$ 0.0)'),
                    ),
                    TextFormField(
                      controller: timeEditController,
                      decoration: InputDecoration(labelText: 'Prazo (meses)'),
                    )
                  ],
                ),
              ),
              new Container(
                width: screenSize.width,
                child: RaisedButton(
                  child: Text(
                    'Calcular',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    presenter.calculatePostFixedCDB(
                        mainValueEditController.value.toString(),
                        timeEditController.value.toString(),
                        actualCDIEditController.value.toString(),
                        offeredRateEditController.value.toString());
                  },
                  color: Colors.blue,
                ),
                margin: new EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ));
  }

  @override
  void onResult(double result) {
    showMessage("The Result is $result");
  }

  @override
  void showMessage(String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Info"),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
