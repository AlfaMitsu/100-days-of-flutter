import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/adjacent_buttons.dart';
import '../widgets/bottom_navigator.dart';
import '../widgets/configure_buttons.dart';

class PopAdvancedView extends StatelessWidget {
  final PageController controller;
  const PopAdvancedView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(flex: 7, child: SizedBox()),
        SvgPicture.asset('assets/svg/heading_advanced.svg'),
        const Expanded(flex: 5, child: SizedBox()),
        SvgPicture.asset('assets/svg/text_adjacent_buttons.svg'),
        const SizedBox(height: 20),
        const AdjacentButtons(),
        const Expanded(flex: 2, child: SizedBox()),
        SvgPicture.asset('assets/svg/text_config_buttons.svg'),
        const SizedBox(height: 20),
        const ConfigureButtons(),
        const Expanded(flex: 4, child: SizedBox()),
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
