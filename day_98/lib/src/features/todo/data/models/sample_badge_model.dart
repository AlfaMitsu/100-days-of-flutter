import 'package:flutter/material.dart';

class SampleBadge {
  final Color? color;
  final Color? badgeColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final String text;

  const SampleBadge(
    this.text, {
    this.color,
    this.badgeColor,
    this.padding,
    this.borderRadius,
  });
}
