import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/common_widgets/index.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0E12),
      appBar: AppBar(title: const Text('Spending Trends'), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: GlassCard(
          child: SizedBox(
            height: 300,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 3), FlSpot(1, 1), FlSpot(2, 4), 
                      FlSpot(3, 2), FlSpot(4, 5), FlSpot(5, 3),
                    ],
                    isCurved: true,
                    color: const Color(0xFF00E676),
                    barWidth: 4,
                    dotData: const FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}