import 'package:day_4/src/featutres/todo/presentation/widgets/pie_chart.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyPieChart(),
    );
  }
}
