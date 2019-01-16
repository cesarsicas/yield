import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YieldCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeld Calculator"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Taxa de CDI (Ao ano )'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Rendimento CDI (%)'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Rendimento CDI (%)'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Prazo (meses)'),
              )
            ],
          ),
        ));
  }
}
