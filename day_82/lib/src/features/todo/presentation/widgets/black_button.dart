import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neopop/neopop.dart';

import '../../../../constants/colors.dart';

class BlackButton extends StatelessWidget {
  final Position position;
  const BlackButton({super.key, this.position = Position.bottomRight});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NeoPopButton(
        color: kSecondaryButtonLightColor,
        animationDuration: kButtonAnimationDuration,
        bottomShadowColor: kShadowColorDarkGreen,
        rightShadowColor: kShadowColorGreen,
        parentColor: kCardColor,
        grandparentColor: kBackgroundColor,
        buttonPosition: position,
        depth: kButtonDepth,
        onTapUp: () => HapticFeedback.lightImpact(),
        onTapDown: () => HapticFeedback.lightImpact(),
        border: Border.all(color: kBorderColorGreen, width: kButtonBorderWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
          child: SvgPicture.asset(
            'assets/svg/cta_text_button.svg',
            color: kPrimaryButtonColor,
          ),
        ),
      ),
    );
  }
}
