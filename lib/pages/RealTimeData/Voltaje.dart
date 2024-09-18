import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VoltageChart extends StatefulWidget {
  @override
  _VoltageChartState createState() => _VoltageChartState();
}

class _VoltageChartState extends State<VoltageChart> {
  late List<ChartData> _chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    _chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      series: <LineSeries<ChartData, int>>[
        LineSeries<ChartData, int>(
          onRendererCreated: (ChartSeriesController controller) {
            _chartSeriesController = controller;
          },
          dataSource: _chartData,
          color: Colors.blue,
          xValueMapper: (ChartData data, _) => data.time,
          yValueMapper: (ChartData data, _) => data.voltage,
        )
      ],
      primaryXAxis: NumericAxis(
        majorGridLines: MajorGridLines(width: 0),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        interval: 3,
        title: AxisTitle(text: 'Tiempo (s)'),
      ),
      primaryYAxis: NumericAxis(
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
        title: AxisTitle(text: 'Voltaje (V)'),
      ),
    );
  }

  int time = 19;
  void updateDataSource(Timer timer) {
    _chartData.add(ChartData(time++, (Random().nextDouble() * 5).toDouble()));
    _chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
      addedDataIndexes: <int>[_chartData.length - 1],
      removedDataIndexes: <int>[0],
    );
  }

  List<ChartData> getChartData() {
    return <ChartData>[
      // Puedes ajustar estos valores iniciales si lo deseas
      ChartData(0, 4.2),
      ChartData(1, 3.7),
      ChartData(2, 2.3),
      ChartData(3, 4.9),
      ChartData(4, 3.4),
      ChartData(5, 2.1),
      ChartData(6, 3.8),
      ChartData(7, 3.1),
      ChartData(8, 4.8),
      ChartData(9, 2.1),
      ChartData(10, 3.3),
      ChartData(11, 4.2),
      ChartData(12, 4.6),
      ChartData(13, 3.2),
      ChartData(14, 4.4),
      ChartData(15, 4.2),
      ChartData(16, 4.6),
      ChartData(17, 4.2),
      ChartData(18, 4.4),
    ];
  }
}

class ChartData {
  ChartData(this.time, this.voltage);
  final int time;
  final double voltage;
}
