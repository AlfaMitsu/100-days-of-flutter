import 'package:day_4/src/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Text('EXPENSES'),
            PieChart(
              swapAnimationDuration: const Duration(milliseconds: 750),
              swapAnimationCurve: Curves.easeInOutQuint,
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: 10,
                    color: kPinkColor,
                  ),
                  PieChartSectionData(
                    title: 'Food',
                    value: 20,
                    color: kBlueColor,
                  ),
                  PieChartSectionData(
                    showTitle: false,
                    value: 30,
                    color: kTealColor,
                  ),
                  PieChartSectionData(
                    borderSide: const BorderSide(color: kBlackColor),
                    value: 40,
                    color: kLightGreenColor,
                  ),
                  PieChartSectionData(
                    radius: 20,
                    value: 50,
                    color: kGreyColor,
                  ),
                  PieChartSectionData(
                    titlePositionPercentageOffset: 2,
                    value: 60,
                    color: kBlackColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
