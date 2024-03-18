import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rive/rive.dart';

class EventSounds extends StatefulWidget {
  const EventSounds({super.key});

  @override
  State<EventSounds> createState() => _EventSoundsState();
}

class _EventSoundsState extends State<EventSounds> {
  final _audioPlayer = AudioPlayer();
  late final StateMachineController _controller;

  @override
  void initState() {
    super.initState();
    _audioPlayer.setAsset('lib/src/resources/assets/rive/step.mp3');
  }

  Future<void> _onRiveInit(Artboard artboard) async {
    _controller =
        StateMachineController.fromArtboard(artboard, 'skill-controller')!;
    artboard.addController(_controller);
    _controller.addEventListener(onRiveEvent);
  }

  void onRiveEvent(RiveEvent event) {
    // ignore: unused_local_variable
    var seconds = event.secondsDelay;

    if (event.name == 'Step') {
      _audioPlayer.seek(Duration.zero);
      _audioPlayer.play();
    }
  }

  @override
  void dispose() {
    _controller.removeEventListener(onRiveEvent);
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: RiveAnimation.asset(
              'lib/src/resources/assets/rive/event_sounds.riv',
              fit: BoxFit.cover,
              onInit: _onRiveInit,
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Sound on!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
