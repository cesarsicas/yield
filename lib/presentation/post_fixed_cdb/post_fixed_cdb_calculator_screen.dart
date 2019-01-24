import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_yield/domain/post_fixed_cdb/model/post_fixed_cdb_result.dart';
import 'package:flutter_yield/presentation/post_fixed_cdb/post_fixed_cdb_calculator_presenter.dart';
import 'package:flutter_yield/presentation/post_fixed_cdb/post_fixed_cdb_calculator_view.dart';
import 'package:flutter_yield/presentation/post_fixed_cdb/result/post_fixed_cdb_result_screen.dart';

class PostFixedCDBCalculatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostFixedCDBCalculatorScreenState();
  }
}

class _PostFixedCDBCalculatorScreenState
    extends State<PostFixedCDBCalculatorScreen>
    implements PostFixedCDBCalculatorView {
  BuildContext context;
  PostFixedCDBCalculatorPresenter presenter;
  final mainValueEditController = TextEditingController();
  final mainValueEditFocus = FocusNode();

  final timeEditController = TextEditingController();
  final timeEditFocus = FocusNode();

  final actualCDIEditController = TextEditingController();
  final actualCDIEditFocus = FocusNode();

  final offeredRateEditController = TextEditingController();
  final offeredRateEditFocus = FocusNode();

  var startValue = "R\$ 0,00";
  var endValue = "R\$ 0,00";
  var grossYield = "R\$ 0,00";
  var netYield = "R\$ 0,00";

  PostFixedCdbResult result;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    this.presenter = PostFixedCDBCalculatorPresenter(this);

//    mainValueEditController.text = "5000";
//    //timeEditController.text = "24";
//    actualCDIEditController.text = "7";
//    offeredRateEditController.text = "100";

    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora CDB Pós Fixado"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: <Widget>[
            TextFormField(
                focusNode: actualCDIEditFocus,
                controller: actualCDIEditController,
                decoration: InputDecoration(
                    labelText: 'CDI Atual (% / Ao ano)', hintText: '00,00'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  BlacklistingTextInputFormatter(new RegExp('[\\.]')),
                ],
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(offeredRateEditFocus);
                }),
            TextFormField(
                focusNode: offeredRateEditFocus,
                controller: offeredRateEditController,
                decoration: InputDecoration(
                    labelText: 'Taxa oferecida CDI (%)', hintText: '00,00'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  BlacklistingTextInputFormatter(new RegExp('[\\.]')),
                ],
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(mainValueEditFocus);
                }),
            TextFormField(
                focusNode: mainValueEditFocus,
                controller: mainValueEditController,
                decoration: InputDecoration(
                    labelText: 'Valor Aplicado (R\$ 0.0)', hintText: '00,00'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  BlacklistingTextInputFormatter(new RegExp('[\\.]')),
                ],
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(timeEditFocus);
                }),
            TextFormField(
              focusNode: timeEditFocus,
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              controller: timeEditController,
              decoration: InputDecoration(labelText: 'Prazo (meses)'),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30, 0.0, 20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Valor Inicial (R\$): "),
                        Text(startValue)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Valor Final (R\$): "),
                        Text(endValue)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Rendimento bruto (R\$): "),
                        Text(grossYield)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Rendimento Líquido (IR 15% -  R\$): "),
                        Text(netYield)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    child: Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      presenter.calculatePostFixedCDB(
                          mainValueEditController.value.text,
                          timeEditController.value.text,
                          actualCDIEditController.value.text,
                          offeredRateEditController.value.text);
                    },
                    color: Colors.blue,
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                      onPressed: () {
                        _onClickShowChart();
                      },
                      child: Text("Ver Gráfico")),
                )),
              ],
            ),
          ]),
        ));
  }

  @override
  void onResult(PostFixedCdbResult result) {
    this.result = result;
    setState(() {
      startValue = result.calc.startValue.toStringAsFixed(2);
      endValue = result.result.toStringAsFixed(2);

      var grossValueNumber = result.result - result.calc.startValue;

      grossYield = (grossValueNumber).toStringAsFixed(2);
      netYield =
          (grossValueNumber - (grossValueNumber * 0.15)).toStringAsFixed(2);
    });
  }

  @override
  void showMessage(String message) {
    print(message);
  }

  void _onClickShowChart() {
    if (this.result != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostFixedCdbResultScreen(this.result)),
      );
    }
  }
}
