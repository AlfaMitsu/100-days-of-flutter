import 'package:flutter/material.dart';

class GradientItem extends StatelessWidget {
  final List<Gradient?> colors;
  final Gradient? selectedColor;
  final ValueChanged<Gradient?> onChanged;

  const GradientItem({
    super.key,
    required this.colors,
    this.selectedColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: colors.map<Widget>((Gradient? namedColor) {
        return GestureDetector(
          onTap: () => onChanged(namedColor),
          child: Container(
            height: 40,
            width: 80,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                  color: namedColor == selectedColor
                      ? Colors.black
                      : const Color(0xFFD5D7DA),
                  width: 2),
              gradient: namedColor,
              color: namedColor != null ? Colors.grey : null,
            ),
            child:
                namedColor == null ? const Center(child: Text('clear')) : null,
          ),
        );
      }).toList(),
    );
  }
}
