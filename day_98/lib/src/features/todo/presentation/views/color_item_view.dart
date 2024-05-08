import 'package:flutter/material.dart';

class ColorItemView extends StatelessWidget {
  final Color color;

  const ColorItemView({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        color.value.toRadixString(16).toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
