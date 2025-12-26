import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SalesOverviewChart extends StatelessWidget {
  const SalesOverviewChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 11, // Jan → Dec
            minY: 0,
            maxY: 30000,

            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 20000,
              getDrawingHorizontalLine: (value) => FlLine(
                color: Colors.grey.withOpacity(0.2),
                strokeWidth: 1,
                dashArray: [5, 5],
              ),
            ),

            titlesData: FlTitlesData(
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),

              // LEFT → Values
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 10000,
                  reservedSize: 40,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '${(value / 1000).toInt()}k',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    );
                  },
                ),
              ),

              // BOTTOM → Months
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    const months = [
                      'Jan',
                      'Feb',
                      'Mar',
                      'Apr',
                      'May',
                      'Jun',
                      'Jul',
                      'Aug',
                      'Sep',
                      'Oct',
                      'Nov',
                      'Dec'
                    ];
                    if (value >= 0 && value < months.length) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          months[value.toInt()],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),

            borderData: FlBorderData(show: false),

            // THREE LINES
            lineBarsData: [
              // Orders → BLACK
              _lineData(
                Colors.black,
                [
                  2000,
                  3000,
                  4000,
                  2000,
                  1000,
                  500,
                  900,
                  2000,
                  1000,
                  700,
                  10000,
                  900
                ],
              ),

              // Sales → RED
              _lineData(
                Colors.red,
                [
                  10000,
                  7000,
                  8000,
                  5000,
                  2000,
                  8000,
                  5000,
                  5000,
                  5050,
                  6200,
                  7000,
                  7500
                ],
              ),

              // New Customers → GREEN
              _lineData(
                Colors.green,
                [
                  8000,
                  9000,
                  10000,
                  11000,
                  5000,
                  11000,
                  10000,
                  12000,
                  11500,
                  10000,
                  10500,
                  4000,
                ],
              ),
            ],

            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (_) => Colors.black87,
                getTooltipItems: (spots) {
                  return spots.map((spot) {
                    return LineTooltipItem(
                      'Value\n',
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: '${spot.y.toInt()}',
                          style: TextStyle(
                            color: spot.bar.color,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  LineChartBarData _lineData(Color color, List<double> values) {
    return LineChartBarData(
      spots: values
          .asMap()
          .entries
          .map((e) => FlSpot(e.key.toDouble(), e.value))
          .toList(),
      isCurved: true,
      color: color,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    );
  }
}
