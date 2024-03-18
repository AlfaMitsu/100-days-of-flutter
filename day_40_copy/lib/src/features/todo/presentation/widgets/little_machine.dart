import 'package:day_40_copy/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class LittleMachine extends StatefulWidget {
  const LittleMachine({super.key});

  @override
  State<LittleMachine> createState() => _LittleMachineState();
}

class _LittleMachineState extends State<LittleMachine> {
  bool get isPlaying => _controller?.isActive ?? false;
  String stateChangeMessage = '';
  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<bool>? _trigger;

  @override
  void initState() {
    super.initState();
    rootBundle.load('lib/src/resources/assets/rive/little_machine.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(
          artboard,
          'State Machine 1',
          onStateChange: _onStateChange,
        );
        if (controller != null) {
          artboard.addController(controller);
          _trigger = controller.findInput('Trigger 1');
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  void _onStateChange(String stateMachineName, String stateName) => setState(
        () => stateChangeMessage =
            'State Changed in $stateMachineName to $stateName',
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _riveArtboard == null
              ? const SizedBox()
              : GestureDetector(
                  onTapDown: (_) => _trigger?.value = true,
                  child: Rive(
                    artboard: _riveArtboard!,
                    fit: BoxFit.cover,
                  ),
                ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Press to activate!',
                style: TextStyle(
                  fontSize: 18,
                  color: kBlackColor,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                stateChangeMessage,
                style: const TextStyle(
                  color: kBlackColor,
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
