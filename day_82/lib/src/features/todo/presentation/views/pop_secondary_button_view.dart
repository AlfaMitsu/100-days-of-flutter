import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neopop/neopop.dart';

import '../../../../constants/colors.dart';
import '../widgets/bottom_navigator.dart';

class PopSecondaryButtonView extends StatelessWidget {
  final PageController controller;
  const PopSecondaryButtonView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(flex: 7, child: SizedBox()),
        SvgPicture.asset('assets/svg/heading_secondary_btns.svg'),
        const Expanded(flex: 8, child: SizedBox()),
        NeoPopButton(
          color: kSecondaryButtonColor,
          parentColor: kSecondaryButtonLightColor,
          depth: kButtonDepth,
          animationDuration: kButtonAnimationDuration,
          buttonPosition: Position.center,
          onTapUp: () => HapticFeedback.lightImpact(),
          onTapDown: () => HapticFeedback.lightImpact(),
          border: const Border.fromBorderSide(
            BorderSide(color: kBorderColorWhite, width: kButtonBorderWidth),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            child: SvgPicture.asset('assets/svg/cta_text_secondary.svg'),
          ),
        ),
        const Expanded(flex: 2, child: SizedBox()),
        NeoPopButton(
          color: kSecondaryButtonLightColor,
          rightShadowColor: kShadowColorLightGrey,
          bottomShadowColor: kShadowColorGrey,
          depth: kButtonDepth,
          animationDuration: kButtonAnimationDuration,
          buttonPosition: Position.fullBottom,
          onTapUp: () => HapticFeedback.lightImpact(),
          onTapDown: () => HapticFeedback.lightImpact(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            child: SvgPicture.asset('assets/svg/cta_text_secondary.svg'),
          ),
        ),
        const Expanded(flex: 2, child: SizedBox()),
        NeoPopButton(
          color: kSecondaryButtonColor,
          parentColor: kSecondaryButtonLightColor,
          depth: kButtonDepth,
          animationDuration: kButtonAnimationDuration,
          buttonPosition: Position.center,
          onTapUp: () => HapticFeedback.lightImpact(),
          onTapDown: () => HapticFeedback.lightImpact(),
          border: const Border.fromBorderSide(
            BorderSide(color: kBorderColorWhite, width: kButtonBorderWidth),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            child: SvgPicture.asset('assets/svg/cta_text_secondary.svg'),
          ),
        ),
        const Expanded(flex: 10, child: SizedBox()),
        BottomNavigator(
          onLeftTap: () => controller.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
          onRightTap: () => controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
        ),
        const Expanded(flex: 2, child: SizedBox()),
      ],
    );
  }
}
