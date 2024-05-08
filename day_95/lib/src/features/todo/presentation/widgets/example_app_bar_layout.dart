import 'package:flutter/material.dart';

import 'example_app_bar.dart';

class ExampleAppBarLayout extends StatelessWidget {
  const ExampleAppBarLayout({
    super.key,
    required this.title,
    this.showGoBack = false,
    required this.child,
  });

  final String title;
  final bool showGoBack;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ExampleAppBar(
              title: title,
              showGoBack: showGoBack,
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
