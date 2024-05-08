import 'package:flutter/material.dart';

import '../widgets/animated_text_example.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<AnimatedTextExample> _examples;
  int _index = 0;
  int _tapCount = 0;

  @override
  void initState() {
    super.initState();
    _examples = animatedTextExamples(onTap: () {
      setState(() {
        _tapCount++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final animatedTextExample = _examples[_index];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          animatedTextExample.label,
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Container(
            decoration: BoxDecoration(color: animatedTextExample.color),
            height: 300.0,
            width: 300.0,
            child: Center(
              key: ValueKey(animatedTextExample.label),
              child: animatedTextExample.child,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text('Taps: $_tapCount'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index = ++_index % _examples.length;
            _tapCount = 0;
          });
        },
        tooltip: 'Next',
        child: const Icon(
          Icons.play_circle_filled,
          size: 50.0,
        ),
      ),
    );
  }
}
