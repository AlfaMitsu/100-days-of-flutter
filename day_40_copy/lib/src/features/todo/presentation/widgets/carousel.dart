import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final riveAnimations = [
    const RiveCustomAnimationData(
      name: 'lib/src/resources/assets/rive/liquid_download.riv',
    ),
    const RiveCustomAnimationData(
      name: 'lib/src/resources/assets/rive/little_machine.riv',
      stateMachines: ['State Machine 1'],
    ),
    const RiveCustomAnimationData(
      name: 'lib/src/resources/assets/rive/off_road_car.riv',
    ),
    const RiveCustomAnimationData(
      name: 'lib/src/resources/assets/rive/rocket.riv',
      stateMachines: ['Button'],
      animations: ['Roll_over'],
    ),
    const RiveCustomAnimationData(
      name: 'lib/src/resources/assets/rive/skills.riv',
      stateMachines: ['Designer\'s Test'],
    ),
  ];

  var _index = 0;
  void next() {
    setState(() {
      _index += 1;
    });
  }

  void previous() {
    setState(() {
      _index -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final indexToShow = _index % riveAnimations.length;
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            GestureDetector(
              onTap: previous,
              child: const Icon(Icons.arrow_back),
            ),
            Expanded(
              child: RiveAnimation.asset(
                riveAnimations[indexToShow].name,
                animations: riveAnimations[indexToShow].animations,
                stateMachines: riveAnimations[indexToShow].stateMachines,
              ),
            ),
            GestureDetector(
              onTap: next,
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}

@immutable
class RiveCustomAnimationData {
  final String name;
  final List<String> animations;
  final List<String> stateMachines;

  const RiveCustomAnimationData({
    required this.name,
    this.animations = const [],
    this.stateMachines = const [],
  });
}
