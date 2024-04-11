import 'package:day_61/src/constants/colors.dart';
import 'package:flutter/material.dart';

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
