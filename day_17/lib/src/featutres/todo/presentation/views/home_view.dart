import 'dart:math' as math;

import 'package:day_17/src/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              child: const Icon(
                Icons.star,
                size: 150,
                color: kBlueColor,
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform(
                  transform: Matrix4.rotationY(_controller.value * math.pi),
                  alignment: Alignment.center,
                  child: child,
                );
              },
              child: const Icon(
                Icons.star,
                size: 150,
                color: kBlueColor,
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.scale(
                  scale: _controller.value,
                  child: child,
                );
              },
              child: const Icon(
                Icons.star,
                size: 150,
                color: kBlueColor,
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  offset: Offset(50.0 * _controller.value, 0.0),
                  child: child,
                );
              },
              child: const Icon(
                Icons.star,
                size: 150,
                color: kBlueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
