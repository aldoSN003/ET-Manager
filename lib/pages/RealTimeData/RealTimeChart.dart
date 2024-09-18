import 'dart:async';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RealTimeChart extends StatefulWidget {
  @override
  _RealTimeChartState createState() => _RealTimeChartState();
}

class _RealTimeChartState extends State<RealTimeChart> {
  List<FlSpot> _dataPoints = [];
  late Timer _timer;
  double _time = 0.0;

  @override
  void initState() {
    super.initState();
    _startSimulation();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startSimulation() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _time += 1;
        double simulatedVoltage = _generateRandomVoltage();
        _dataPoints.add(FlSpot(_time, simulatedVoltage));

        if (_dataPoints.length > 20) {
          _dataPoints.removeAt(0);
        }
      });
    });
  }

  double _generateRandomVoltage() {
    final random = Random();
    return random.nextDouble() * 10;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Voltaje en Tiempo Real',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: true),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          axisNameWidget: Text('Tiempo (s)'),
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: _time > 20 ? _time / 5 : 4,
                            getTitlesWidget: (value, meta) {
                              return RotatedBox(
                                quarterTurns: 3,
                                child: Text(value.toInt().toString()),
                              );
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          axisNameWidget: Text('Voltaje (V)'),
                          sideTitles: SideTitles(showTitles: true),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: true),
                      lineBarsData: [
                        LineChartBarData(
                          spots: _dataPoints,
                          isCurved: true,
                          color: Colors.red,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                      minX: 0,
                      maxX: _time > 20 ? _time : 20,
                      minY: 0,
                      maxY: 10,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Actualización cada segundo',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
