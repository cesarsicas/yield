import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yield/presentation/post_fixed_cdb/result/post_fixed_cdb_result_screen.dart';

class PostFixedCDBCalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

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
                      decoration:
                          InputDecoration(labelText: 'CDI (% / Ao ano)'),
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Rendimento CDI (%)'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Valor Aplicado (R\$ 0.0)'),
                    ),
                    TextFormField(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostFixedCDBResult()),
                    );
                  },
                  color: Colors.blue,
                ),
                margin: new EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ));
  }
}
