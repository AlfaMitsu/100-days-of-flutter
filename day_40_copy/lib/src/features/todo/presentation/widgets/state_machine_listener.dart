import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class StateMachineListener extends StatefulWidget {
  const StateMachineListener({super.key});

  @override
  State<StateMachineListener> createState() => _StateMachineListenerState();
}

class _StateMachineListenerState extends State<StateMachineListener> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RiveAnimation.asset(
          'lib/src/resources/assets/rive/light_switch.riv',
          fit: BoxFit.contain,
          stateMachines: ['Switch'],
        ),
      ),
    );
  }
}
