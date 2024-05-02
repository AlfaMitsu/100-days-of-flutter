import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neopop/neopop.dart';

import '../../../../constants/colors.dart';

class HomeViewCta extends StatelessWidget {
  final String childPath;
  final VoidCallback onTap;

  const HomeViewCta({
    super.key,
    required this.childPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      color: kSecondaryButtonLightColor,
      parentColor: kSecondaryButtonLightColor,
      depth: kButtonDepth,
      animationDuration: kButtonAnimationDuration,
      buttonPosition: Position.center,
      border: Border.all(color: kBorderColorWhite, width: kButtonBorderWidth),
      onTapUp: () => onTap(),
      onTapDown: () => HapticFeedback.lightImpact(),
      child: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SvgPicture.asset(childPath),
        ),
      ),
    );
  }
}
