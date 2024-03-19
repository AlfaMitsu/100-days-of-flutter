import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SkinningDemo extends StatefulWidget {
  const SkinningDemo({super.key});

  @override
  State<SkinningDemo> createState() => _SkinningDemoState();
}

class _SkinningDemoState extends State<SkinningDemo> {
  static const _skinMapping = {
    "Skin_0": "Plain",
    "Skin_1": "Summer",
    "Skin_2": "Elvis",
    "Skin_3": "Superhero",
    "Skin_4": "Astronaut"
  };

  String _currentState = 'Plain';

  SMITrigger? _skin;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      'Motion',
      onStateChange: _onStateChange,
    );

    artboard.addController(controller!);
    _skin = controller.findInput<bool>('Skin') as SMITrigger;
  }

  void _onStateChange(String stateMachineName, String stateName) {
    if (stateName.contains("Skin_")) {
      setState(() {
        _currentState = _skinMapping[stateName] ?? 'Plain';
      });
    }
  }

  void _swapSkin() {
    _skin?.fire();
  }

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFFefcb7d);

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: RiveAnimation.asset(
              'lib/src/resources/assets/rive/skins_demo.riv',
              fit: BoxFit.cover,
              onInit: _onRiveInit,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'Choose an Avatar',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: _swapSkin,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xFF7d99ef),
                    ),
                  ),
                  child: const Text('Swap Skin'),
                ),
                const Spacer(),
                Text(
                  'Skin: $_currentState',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 48)
              ],
            ),
          )
        ],
      ),
    );
  }
}
