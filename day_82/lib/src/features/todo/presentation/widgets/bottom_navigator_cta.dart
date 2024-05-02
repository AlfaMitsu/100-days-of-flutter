import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigatorCta extends StatelessWidget {
  final VoidCallback? onTap;
  final String svgPath;

  const BottomNavigatorCta({
    super.key,
    this.onTap,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        svgPath,
        height: 40.0,
        width: 40.0,
      ),
    );
  }
}
