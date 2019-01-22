import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_yield/domain/post_fixed_cdb/model/post_fixed_cdb_result.dart';

class PostFixedCdbResultScreen extends StatelessWidget {
  PostFixedCdbResult result;

  PostFixedCdbResultScreen(PostFixedCdbResult result) {
    this.result = result;
  }

  @override
  Widget build(BuildContext context) {
    final chartData = generateChartData();

    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: charts.TimeSeriesChart(
        chartData,
        animate: false,
        dateTimeFactory: const charts.LocalDateTimeFactory(),
      ),
    );
  }

  List<charts.Series<TimeSeriesSales, DateTime>> generateChartData() {
    final data = [
      new TimeSeriesSales(DateTime.now(), this.result.calc.startValue.toInt()),
      new TimeSeriesSales(
          DateTime.now()
              .add(new Duration(days: this.result.calc.timeInMonths * 30)),
          this.result.result.toInt()),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

}

/// Sample time series data type.class

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
