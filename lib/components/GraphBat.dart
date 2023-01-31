import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'ChartData.dart';

class GraphBat extends StatefulWidget {
  List<ChartData> chartdata = <ChartData>[];
  final Color color;
  GraphBat(
    this.color,
    this.chartdata,
  );

  @override
  State<GraphBat> createState() => _GraphBatState();
}

class _GraphBatState extends State<GraphBat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          axisLine: const AxisLine(color: Colors.black, width: 2),
          labelStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w300, fontSize: 13),
        ),
        primaryYAxis: NumericAxis(
          axisLine: const AxisLine(color: Colors.black, width: 2),
          labelStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w300, fontSize: 13),
        ),
        series: <ChartSeries>[
          SplineSeries<ChartData, String>(
            color: widget.color,
            dataSource: widget.chartdata,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            markerSettings: const MarkerSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}
