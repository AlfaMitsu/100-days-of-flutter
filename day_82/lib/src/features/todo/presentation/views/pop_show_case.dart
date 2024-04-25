import 'package:flutter/material.dart';

import '../widgets/pop_view_wrapper.dart';
import 'pop_advanced_view.dart';
import 'pop_button_view.dart';
import 'pop_primary_button_view.dart';
import 'pop_secondary_button_view.dart';

class PopShowCase extends StatelessWidget {
  final int initialIndex;
  const PopShowCase({super.key, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: initialIndex);

    return PopViewWrapper(
      child: PageView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        children: [
          PopButtonView(controller: controller),
          PopPrimaryButtonView(controller: controller),
          PopSecondaryButtonView(controller: controller),
          PopAdvancedView(controller: controller),
        ],
      ),
    );
  }
}
