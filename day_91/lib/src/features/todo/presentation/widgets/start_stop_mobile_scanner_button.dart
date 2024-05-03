import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../constants/colors.dart';

class StartStopMobileScannerButton extends StatelessWidget {
  final MobileScannerController controller;
  const StartStopMobileScannerButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, state, child) {
        if (!state.isInitialized || !state.isRunning) {
          return IconButton(
            color: kWhiteColor,
            icon: const Icon(Icons.play_arrow),
            iconSize: 32,
            onPressed: () async {
              await controller.start();
            },
          );
        }

        return IconButton(
          color: kWhiteColor,
          icon: const Icon(Icons.stop),
          iconSize: 32,
          onPressed: () async {
            await controller.stop();
          },
        );
      },
    );
  }
}
