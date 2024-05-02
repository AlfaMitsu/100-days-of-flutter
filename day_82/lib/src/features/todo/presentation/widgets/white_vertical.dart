import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neopop/neopop.dart';

import '../../../../constants/colors.dart';

class WhiteVertical extends StatelessWidget {
  const WhiteVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      color: kPrimaryButtonColor,
      animationDuration: kButtonAnimationDuration,
      buttonPosition: Position.fullBottom,
      depth: kButtonDepth,
      onTapUp: () => HapticFeedback.lightImpact(),
      onTapDown: () => HapticFeedback.lightImpact(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 17.5),
        child: SvgPicture.asset('lib/src/resources/assets/svg/cta_text_button.svg'),
      ),
    );
  }
}
