import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PlayPauseAnimation extends StatefulWidget {
  const PlayPauseAnimation({super.key});

  @override
  State<PlayPauseAnimation> createState() => _PlayPauseAnimationState();
}

class _PlayPauseAnimationState extends State<PlayPauseAnimation> {
  late RiveAnimationController _controller;

  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RiveAnimation.asset(
        'lib/src/resources/assets/rive/off_road_car.riv',
        fit: BoxFit.cover,
        controllers: [_controller],
        onInit: (_) => setState(() {}),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
