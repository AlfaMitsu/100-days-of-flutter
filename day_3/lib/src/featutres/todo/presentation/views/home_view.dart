import 'package:day_3/src/featutres/todo/presentation/widgets/bar_graph.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<double> weeklySummary = [
    60,
    15,
    50,
    10,
    80,
    70,
    75,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey800Color,
      body: Center(
        child: SizedBox(
          height: 200,
          child: BarGraph(
            weeklySummary: weeklySummary,
          ),
        ),
      ),
    );
  }
}
