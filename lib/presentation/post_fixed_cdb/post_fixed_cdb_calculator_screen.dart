import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_yield/domain/post_fixed_cdb/model/post_fixed_cdb_result.dart';
import 'package:flutter_yield/presentation/post_fixed_cdb/post_fixed_cdb_calculator_presenter.dart';
import 'package:flutter_yield/presentation/post_fixed_cdb/post_fixed_cdb_calculator_view.dart';

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

  var resultValue = "R\$ 0,00";

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
                        focusNode: actualCDIEditFocus,
                        controller: actualCDIEditController,
                        decoration: InputDecoration(
                            labelText: 'CDI Atual (% / Ao ano)',
                            hintText: '00,00'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          BlacklistingTextInputFormatter(new RegExp('[\\.]')),
                        ],
                        onFieldSubmitted: (v) {
                          FocusScope.of(context)
                              .requestFocus(offeredRateEditFocus);
                        }),
                    TextFormField(
                        focusNode: offeredRateEditFocus,
                        controller: offeredRateEditController,
                        decoration: InputDecoration(
                            labelText: 'Taxa oferecida CDI (%)',
                            hintText: '00,00'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          BlacklistingTextInputFormatter(new RegExp('[\\.]')),
                        ],
                        onFieldSubmitted: (v) {
                          FocusScope.of(context)
                              .requestFocus(mainValueEditFocus);
                        }),
                    TextFormField(
                        focusNode: mainValueEditFocus,
                        controller: mainValueEditController,
                        decoration: InputDecoration(
                            labelText: 'Valor Aplicado (R\$ 0.0)',
                            hintText: '00,00'),
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
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      controller: timeEditController,
                      decoration: InputDecoration(labelText: 'Prazo (meses)'),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 30, 0.0, 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Resultado: "),
                            Text(resultValue)
                          ],
                        ),
                      ),
                    ),
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
                        mainValueEditController.value.text,
                        timeEditController.value.text,
                        actualCDIEditController.value.text,
                        offeredRateEditController.value.text);
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
  void onResult(PostFixedCdbResult result) {
    setState(() {
      resultValue = "R\$ ${result.result}";
    });
  }

  @override
  void showMessage(String message) {
    print(message);

//    // flutter defined function
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return AlertDialog(
//          title: new Text("Info"),
//          content: new Text(message),
//          actions: <Widget>[
//            // usually buttons at the bottom of the dialog
//            new FlatButton(
//              child: new Text("Ok"),
//              onPressed: () {
//                Navigator.pop(context);
//              },
//            ),
//          ],
//        );
//      },
//    );
  }
}
