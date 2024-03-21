import 'package:flutter/material.dart';

import '../../domain/repositories/color_extension.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final VoidCallback onPressed;
  const RoundButton(
      {super.key, required this.title, this.bgColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      minWidth: double.maxFinite,
      elevation: 0.1,
      color: bgColor ?? TColor.primary,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}

