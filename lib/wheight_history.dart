import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightHistoryGraphWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve weight history from Firestore
    List<FlSpot> weightHistory = [
      // Sample data
      FlSpot(0, 70),
      FlSpot(1, 72),
      FlSpot(2, 71),
      FlSpot(3, 73),
      FlSpot(4, 75),
      FlSpot(5, 74),
      FlSpot(6, 76),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Weight History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
            ),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: weightHistory,
                isCurved: true,
                barWidth: 2,
                color: Colors.blue, // Updated to use 'color' instead of 'colors'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
