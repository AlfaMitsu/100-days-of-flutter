import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CustomController extends StatelessWidget {
  const CustomController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiveAnimation.asset(
          'lib/src/resources/assets/rive/vehicles.riv',
          fit: BoxFit.cover,
          animations: const ['idle'],
          controllers: [
            SpeedController(
              'curves',
              speedMultiplier: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class SpeedController extends SimpleAnimation {
  final double speedMultiplier;

  SpeedController(
    super.animationName, {
    super.mix,
    this.speedMultiplier = 1,
  });

  @override
  void apply(RuntimeArtboard artboard, double elapsedSeconds) {
    if (instance == null || !instance!.keepGoing) {
      isActive = false;
    }
    instance!
      ..animation.apply(instance!.time, coreContext: artboard, mix: mix)
      ..advance(elapsedSeconds * speedMultiplier);
  }
}
