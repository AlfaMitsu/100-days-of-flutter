import 'package:flutter/material.dart';

import '../widgets/segmented_button_multiple_choice.dart';
import '../widgets/segmented_button_single_choice.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SegmentedButtonSingleChoice(),
          SizedBox(height: 50),
          SegmentedButtonMultipleChoice(),
        ],
      ),
    );
  }
}
