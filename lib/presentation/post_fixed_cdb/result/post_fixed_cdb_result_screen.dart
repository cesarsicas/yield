import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_yield/domain/post_fixed_cdb/model/post_fixed_cdb_result.dart';

class PostFixedCdbResultScreen extends StatelessWidget {
  PostFixedCdbResult finalResult;

  PostFixedCdbResultScreen(PostFixedCdbResult result) {
    this.finalResult = result;
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

  List<charts.Series<TimeSeries, DateTime>> generateChartData() {
    final data = [
      new TimeSeries(DateTime.now(), this.finalResult.calc.startValue),
      new TimeSeries(
          DateTime.now()
              .add(new Duration(days: this.finalResult.calc.timeInMonths * 30)),
          this.finalResult.result),
    ];

    return [
      new charts.Series<TimeSeries, DateTime>(
        id: 'Yield',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeries series, _) => series.period,
        measureFn: (TimeSeries series, _) => series.yield,
        data: data,
      )
    ];
  }
}
class TimeSeries {
  final DateTime period;
  final double yield;

  TimeSeries(this.period, this.yield);
}
