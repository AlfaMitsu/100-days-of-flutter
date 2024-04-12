import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/dimensions.dart';
import '../../data/data_sources/chart_data.dart';

class Profit extends StatelessWidget {
  const Profit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: defaultPadding * 5.3,
            top: defaultPadding * 3,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: FDottedLine(
              color: kSecondaryColor,
              height: 130,
            ),
          ),
        ),
        SizedBox(
          height: 130,
          child: SfCartesianChart(
            onMarkerRender: (MarkerRenderArgs args) {
              if (!(args.pointIndex == 8)) {
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
              isVisible: false,
            ),
            primaryYAxis: const NumericAxis(
              isVisible: false,
            ),
            series: <LineSeries<ChartSplineData, String>>[
              LineSeries(
                color: kSecondaryColor,
                markerSettings: const MarkerSettings(
                  isVisible: true,
                  color: kBgColor,
                  borderColor: kSecondaryColor,
                  borderWidth: 3,
                  height: 10,
                  width: 10,
                ),
                width: 3,
                dataSource: chartData2,
                xValueMapper: (ChartSplineData data, _) => data.month,
                yValueMapper: (ChartSplineData data, _) => data.amount,
              )
            ],
          ),
        ),
      ],
    );
  }
}
