import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SimpleAssetAnimation extends StatelessWidget {
  const SimpleAssetAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RiveAnimation.asset(
          'lib/src/resources/assets/rive/off_road_car.riv',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
