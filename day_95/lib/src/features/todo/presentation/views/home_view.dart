import 'package:flutter/material.dart';

import '../widgets/common_use_cases.dart';
import '../widgets/controller_example.dart';
import '../widgets/custom_child_example.dart';
import '../widgets/dialog_example.dart';
import '../widgets/example_app_bar.dart';
import '../widgets/gallery_example.dart';
import '../widgets/gesture_rotation_example.dart';
import '../widgets/hero_example.dart';
import '../widgets/inline_example.dart';
import '../widgets/network_example.dart';
import '../widgets/programmatic_rotation_example.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const ExampleAppBar(
            title: "Photo View",
            showGoBack: true,
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              "See bellow examples of some of the most common photo view usage cases",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CommonUseCasesExamples(),
                      ),
                    );
                  },
                  text: "Common use cases",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const GalleryExample(),
                      ),
                    );
                  },
                  text: "Gallery",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HeroExample(),
                      ),
                    );
                  },
                  text: "Hero animation",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NetworkExample(),
                      ),
                    );
                  },
                  text: "Network images",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ControllerExample(),
                      ),
                    );
                  },
                  text: "Controller",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InlineExample(),
                      ),
                    );
                  },
                  text: "Part of the screen",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CustomChildExample(),
                      ),
                    );
                  },
                  text: "Custom child",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DialogExample(),
                      ),
                    );
                  },
                  text: "Integrated to dialogs",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GestureRotationExample(),
                      ),
                    );
                  },
                  text: "Rotation Gesture",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProgrammaticRotationExample(),
                      ),
                    );
                  },
                  text: "Rotation Programmatic",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(context,
      {required String text, required VoidCallback onPressed}) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
      ),
    );
  }
}
