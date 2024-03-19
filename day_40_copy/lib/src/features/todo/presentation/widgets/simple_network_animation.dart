import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SimpleNetworkAnimation extends StatelessWidget {
  const SimpleNetworkAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RiveAnimation.network(
          'https://cdn.rive.app/animations/vehicles.riv',
          fit: BoxFit.cover,
          placeHolder: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
