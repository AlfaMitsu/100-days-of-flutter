import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../widgets/line_chart.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueGreyColor,
      body: Center(
        child: Container(
          color: kBlueGreyColor,
          height: 450,
          width: 400,
          child: const MyLineChart(),
        ),
      ),
    );
  }
}