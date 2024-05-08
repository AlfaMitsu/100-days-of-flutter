import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 140,
          child: AutoSizeText(
            'This string will be automatically resized to fit in two lines.',
            style: TextStyle(fontSize: 30),
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
