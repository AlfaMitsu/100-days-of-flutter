import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neopop/neopop.dart';

import '../../../../constants/colors.dart';
import '../widgets/bottom_navigator.dart';

class PopButtonView extends StatefulWidget {
  final PageController controller;
  const PopButtonView({super.key, required this.controller});

  @override
  State<PopButtonView> createState() => _PopButtonViewState();
}

class _PopButtonViewState extends State<PopButtonView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const Expanded(
            flex: 5,
            child: SizedBox(),
          ),
          SvgPicture.asset('lib/src/resources/assets/svg/heading_buttons.svg'),
          const Expanded(
            flex: 4,
            child: SizedBox(),
          ),
          SvgPicture.asset(
              'lib/src/resources/assets/svg/text_floating_tilted_button.svg'),
          const SizedBox(height: 15),
          NeoPopTiltedButton(
            isFloating: true,
            onTapUp: () => HapticFeedback.lightImpact(),
            onTapDown: () => HapticFeedback.lightImpact(),
            decoration: const NeoPopTiltedButtonDecoration(
              color: kPopYellowColor,
              plunkColor: kPlunkColorYellow,
              shadowColor: kTiltedButtonShadowColor,
              showShimmer: true,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70,
                vertical: 15,
              ),
              child: SvgPicture.asset(
                  'lib/src/resources/assets/svg/cta_text_play_now.svg'),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          SvgPicture.asset(
              'lib/src/resources/assets/svg/text_non_floating_tilt_button.svg'),
          const SizedBox(height: 15),
          NeoPopTiltedButton(
            color: kPrimaryButtonColor,
            onTapUp: () => HapticFeedback.lightImpact(),
            onTapDown: () => HapticFeedback.lightImpact(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 15,
              ),
              child: SvgPicture.asset(
                  'lib/src/resources/assets/svg/cta_text_view.svg'),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          SvgPicture.asset(
              'lib/src/resources/assets/svg/text_stroke_button.svg'),
          const SizedBox(height: 18),
          NeoPopButton(
            color: kSecondaryButtonLightColor,
            bottomShadowColor: kShadowColorDarkGreen,
            rightShadowColor: kShadowColorGreen,
            animationDuration: kButtonAnimationDuration,
            depth: kButtonDepth,
            onTapUp: () => HapticFeedback.lightImpact(),
            onTapDown: () => HapticFeedback.lightImpact(),
            border: Border.all(
              color: kBorderColorGreen,
              width: kButtonBorderWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 15,
              ),
              child: SvgPicture.asset(
                  'lib/src/resources/assets/svg/cta_text_scan.svg'),
            ),
          ),
          const Expanded(
            flex: 4,
            child: SizedBox(),
          ),
          BottomNavigator(
            onLeftTap: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
            onRightTap: () => widget.controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
