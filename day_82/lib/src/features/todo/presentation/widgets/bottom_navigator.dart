import 'package:flutter/material.dart';

import 'bottom_navigator_cta.dart';

class BottomNavigator extends StatelessWidget {
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;
  
  const BottomNavigator({
    super.key,
    required this.onLeftTap,
    required this.onRightTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        BottomNavigatorCta(
          svgPath: 'lib/src/resources/assets/svg/left_nav_cta.svg',
          onTap: onLeftTap,
        ),
        const SizedBox(width: 10),
        BottomNavigatorCta(
          svgPath: 'lib/src/resources/assets/svg/cross_nav_cta.svg',
          onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
        ),
        const SizedBox(width: 10),
        BottomNavigatorCta(
          svgPath: 'lib/src/resources/assets/svg/right_nav_cta.svg',
          onTap: onRightTap,
        ),
      ],
    );
  }
}
