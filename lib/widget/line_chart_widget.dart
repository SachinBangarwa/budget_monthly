import 'dart:ui';
import 'package:budget_monthly/color/home_color_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<Color> gradientColors = [
  primary,
  secondary,
];

LineChartData activityData() {
  return LineChartData(
    gridData: FlGridData(
      show: false,
      drawVerticalLine: true,
    ),
    titlesData: FlTitlesData(
      show: false,
    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 3),
          FlSpot(2.6, 2.5),
          FlSpot(4.9, 4),
          FlSpot(6.7, 3.5),
          FlSpot(8, 4.5),
          FlSpot(9.5, 3),
          FlSpot(11, 5),
        ],
        isCurved: true,
        colors: [primary],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradientFrom: Offset(0, 0), // Starting point of gradient
          gradientTo: Offset(0, 1),   // Ending point of gradient
          colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ],
  );
}
