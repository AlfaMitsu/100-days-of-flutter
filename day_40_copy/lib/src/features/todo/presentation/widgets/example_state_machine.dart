import 'package:day_40_copy/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class ExampleStateMachine extends StatefulWidget {
  const ExampleStateMachine({super.key});

  @override
  State<ExampleStateMachine> createState() => _ExampleStateMachineState();
}

class _ExampleStateMachineState extends State<ExampleStateMachine> {
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<bool>? _hoverInput;
  SMIInput<bool>? _pressInput;

  @override
  void initState() {
    super.initState();

    rootBundle.load('lib/src/resources/assets/rive/rocket.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, 'Button');
        if (controller != null) {
          artboard.addController(controller);
          _hoverInput = controller.findInput('Hover');
          _pressInput = controller.findInput('Press');
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _riveArtboard == null
          ? const SizedBox()
          : MouseRegion(
              onEnter: (_) => _hoverInput?.value = true,
              onExit: (_) => _hoverInput?.value = false,
              child: GestureDetector(
                onTapDown: (_) => _pressInput?.value = true,
                onTapCancel: () => _pressInput?.value = false,
                onTapUp: (_) => _pressInput?.value = false,
                child: Stack(
                  children: [
                    Rive(
                      fit: BoxFit.cover,
                      artboard: _riveArtboard!,
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(18),
                        child: Text(
                          'Try pressing the button...',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kGrey800Color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
