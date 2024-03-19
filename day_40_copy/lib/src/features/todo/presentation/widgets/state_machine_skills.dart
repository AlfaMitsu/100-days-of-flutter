import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class StateMachineSkills extends StatefulWidget {
  const StateMachineSkills({super.key});

  @override
  State<StateMachineSkills> createState() => _StateMachineSkillsState();
}

class _StateMachineSkillsState extends State<StateMachineSkills> {
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<double>? _levelInput;

  @override
  void initState() {
    super.initState();
    rootBundle.load('lib/src/resources/assets/rive/skills.riv').then(
      (data) async {
        final file = RiveFile.import(data);

        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, 'Designer\'s Test');
        if (controller != null) {
          artboard.addController(controller);
          _levelInput = controller.findInput('Level');
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Stack(
                children: [
                  Positioned.fill(
                    child: Rive(
                      artboard: _riveArtboard!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    bottom: 32,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          child: const Text('Beginner'),
                          onPressed: () => _levelInput?.value = 0,
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          child: const Text('Intermediate'),
                          onPressed: () => _levelInput?.value = 1,
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          child: const Text('Expert'),
                          onPressed: () => _levelInput?.value = 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
