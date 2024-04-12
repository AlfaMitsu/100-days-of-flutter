import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

final List<ChartData> chartData = [
  ChartData(
    '3 Level',
    40,
    kSecondaryColor,
  ),
];

class ChartData {
  final String level;
  final double y;
  final Color color;

  ChartData(
    this.level,
    this.y,
    this.color,
  );
}

class ChartSplineData {
  String month;
  double amount = 0;

  ChartSplineData(this.month, this.amount);
}

final List<ChartSplineData> chartData2 = <ChartSplineData>[
  ChartSplineData('JAN', 3),
  ChartSplineData('FEB', 8),
  ChartSplineData('MAR', 5),
  ChartSplineData('APR', 5.5),
  ChartSplineData('MAY', 9),
  ChartSplineData('JUN', 6),
  ChartSplineData('JUL', 14),
  ChartSplineData('AUG', 8),
  ChartSplineData('SEPT', 12),
  ChartSplineData('OCT', 6),
  ChartSplineData('NOV', 12),
];


