import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TotalRevenueChart extends StatelessWidget {
  final List<double> revenueData;

  const TotalRevenueChart({super.key, required this.revenueData});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              drawHorizontalLine: true,
              horizontalInterval: 500,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.grey.shade300,
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 500,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '\$${value.toInt()}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      'Day ${value.toInt() + 1}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    );
                  },
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: const Border(
                left: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(
                  revenueData.length,
                  (index) => FlSpot(index.toDouble(), revenueData[index]),
                ),
                isCurved: true,
                color: Colors.blue,
                barWidth: 3,
                dotData: FlDotData(show: true),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue.withOpacity(0.3), // Inner fill color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
