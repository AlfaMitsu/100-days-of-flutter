import 'package:day_57/src/constants/colors.dart';
import 'package:day_57/src/constants/dimensions.dart';
import 'package:day_57/src/features/todo/data/models/chart_spline_model.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/chart_data.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: Container(
        padding: const EdgeInsets.only(top: defaultPadding * 4),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: defaultPadding * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(kImgLogo),
                  ),
                  Column(
                    children: [
                      const Text(
                        'Dashboard',
                        style: kDashboardTitleTextStyle,
                      ),
                      SizedBox(
                        height: 10,
                        width: 150,
                        child: Image.asset(kImgShape2),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Image.asset(kImgShape1),
                      ),
                      const Icon(
                        Icons.settings_outlined,
                        size: 40,
                        color: kWhiteColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.only(left: defaultPadding * 2),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GradientText(
                        'Current',
                        style: kGetStartedTextStyle,
                        colors: const [
                          Color(0xFFA9E7A1),
                          Color(0xFFFDD19A),
                        ],
                      ),
                      GradientText(
                        'Balance',
                        style: kBalanceTextStyle,
                        colors: const [
                          Color(0xFFA9E7A1),
                          Color(0xFFFDD19A),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 10,
                    ),
                    child: Text(
                      '\$',
                      style: kCurrencyTextStyle,
                    ),
                  ),
                  Text(
                    '26,000',
                    style: kHomeViewHeadingTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: SfCartesianChart(
                onDataLabelRender: (DataLabelRenderArgs args) {
                  if (args.pointIndex == 4) {
                    args.text = '\$10.00';
                    args.textStyle = kCartesianTextStyle;
                    args.offset = const Offset(
                      0,
                      20,
                    );
                  }
                  if (args.pointIndex != 4) {
                    args.text = '';
                  }
                },
                onMarkerRender: (MarkerRenderArgs args) {
                  if (!(args.pointIndex == 4)) {
                    args.markerHeight = 0;
                    args.markerWidth = 0;
                  }
                },
                plotAreaBackgroundColor: kTransparent,
                margin: const EdgeInsets.all(0),
                borderColor: kTransparent,
                borderWidth: 0,
                plotAreaBorderWidth: 0,
                primaryXAxis: const CategoryAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  majorTickLines: MajorTickLines(width: 0),
                  labelStyle: TextStyle(
                    color: Colors.white38,
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                primaryYAxis: const NumericAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  majorTickLines: MajorTickLines(width: 0),
                  isVisible: false,
                ),
                series: <CartesianSeries<dynamic, dynamic>>[
                  SplineSeries<ChartSplineData, String>(
                    color: const Color(0xFFA9E7A1),
                    width: 4,
                    dataSource: chartData,
                    xValueMapper: (ChartSplineData data, _) => data.month,
                    yValueMapper: (ChartSplineData data, _) => data.amount,
                  ),
                  SplineSeries<ChartSplineData, String>(
                    color: const Color(0xFFFDD19A),
                    width: 4,
                    dataSource: chartData2,
                    markerSettings: const MarkerSettings(
                      isVisible: true,
                      color: Color(0xFFFDD19A),
                      borderColor: kWhiteColor,
                      borderWidth: 4,
                      height: 20,
                      width: 20,
                    ),
                    dataLabelSettings: DataLabelSettings(
                      useSeriesColor: true,
                      isVisible: true,
                      labelAlignment: ChartDataLabelAlignment.top,
                    ),
                    xValueMapper: (ChartSplineData data, _) => data.month,
                    yValueMapper: (ChartSplineData data, _) => data.amount,
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
