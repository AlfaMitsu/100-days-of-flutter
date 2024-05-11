import 'package:flutter/material.dart';

import 'splash_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void _onBackToIntro(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const SplashView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("This is the screen after Introduction"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _onBackToIntro(context),
              child: const Text('Back to Introduction'),
            ),
          ],
        ),
      ),
    );
  }
}
