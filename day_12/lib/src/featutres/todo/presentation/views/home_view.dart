import 'package:flutter/material.dart';

import 'info_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void _openIconButtonPressed() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const InfoView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('App Bar'),
        actions: [
          IconButton(
            onPressed: _openIconButtonPressed,
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Home screen',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
