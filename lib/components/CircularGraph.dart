import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import '../DetailBateriePage.dart';

class CircularGraph extends StatelessWidget {
  const CircularGraph({
    super.key,
    required this.chartData,
  });

  final List<ChartData> chartData;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series: <CircularSeries>[
        // Render pie chart
        RadialBarSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y)
      ],
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Container(
            child: const Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '70%',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.green),
                  ),
                  TextSpan(
                    text: ' \nCapacité restante ',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
