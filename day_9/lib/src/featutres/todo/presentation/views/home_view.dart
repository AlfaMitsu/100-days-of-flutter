import 'package:day_9/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../data/data_sources/list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: widgets.length,
      initialIndex: _index,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTealColor,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          TabBarView(
            controller: controller,
            children: widgets,
          ),
          Positioned(
            bottom: 40,
            child: TabPageSelector(
              controller: controller,
              color: Colors.black,
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _index = (_index - 1) % widgets.length;
              });
              controller.animateTo(_index);
            },
            hoverElevation: 0,
            elevation: 0,
            child: const Icon(Icons.navigate_before),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _index = (_index + 1) % widgets.length;
              });
              controller.animateTo(_index);
            },
            hoverElevation: 0,
            elevation: 0,
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
