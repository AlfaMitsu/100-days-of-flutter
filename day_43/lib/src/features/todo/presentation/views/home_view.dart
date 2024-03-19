import 'package:flutter/material.dart';

import '../widgets/button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Button(),
      ),
    );
  }
}