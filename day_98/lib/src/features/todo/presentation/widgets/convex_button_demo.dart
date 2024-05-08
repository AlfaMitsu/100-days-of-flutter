import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class ConvexButtonDemo extends StatefulWidget {
  const ConvexButtonDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ConvexButtonDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ConvexButton Example')),
      body: Center(child: Text('count $count')),
      bottomNavigationBar: ConvexButton.fab(
        onTap: () => setState(() => count++),
      ),
    );
  }
}
