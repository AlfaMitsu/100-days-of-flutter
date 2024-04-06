import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/chart_data.dart';
import '../../data/models/chart_spline_model.dart';

class ContainerChartCard extends StatelessWidget {
  const ContainerChartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: SfCartesianChart(
        onDataLabelRender: (DataLabelRenderArgs args) {
          if (args.pointIndex == 4) {
            args.text = '\$4.00';
            args.textStyle = kCartesianTextStyle;
            args.offset = const Offset(
              0,
              10,
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
          isVisible: false,
          labelPlacement: LabelPlacement.onTicks,
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          majorGridLines: MajorGridLines(width: 0),
          majorTickLines: MajorTickLines(width: 0),
        ),
        primaryYAxis: const NumericAxis(
          plotOffset: 5,
          maximum: 16,
          minimum: 0,
          majorGridLines: MajorGridLines(width: 0),
          majorTickLines: MajorTickLines(width: 0),
          isVisible: false,
        ),
        series: <CartesianSeries<dynamic, dynamic>>[
          LineSeries<ChartSplineData, String>(
            color: Colors.orangeAccent,
            width: 4,
            dataSource: chartData3,
            xValueMapper: (ChartSplineData data, _) => data.month,
            yValueMapper: (ChartSplineData data, _) => data.amount,
          ),
          AreaSeries<ChartSplineData, String>(
            color: const Color(0xFFFDD19A),
            dataSource: chartData3,
            markerSettings: const MarkerSettings(
              isVisible: true,
              color: Color(0xFFFDD19A),
              borderColor: kWhiteColor,
              borderWidth: 2,
              height: 10,
              width: 10,
            ),
            dataLabelSettings: const DataLabelSettings(
              opacity: 0.2,
              useSeriesColor: true,
              isVisible: true,
              labelAlignment: ChartDataLabelAlignment.top,
            ),
            xValueMapper: (ChartSplineData data, _) => data.month,
            yValueMapper: (ChartSplineData data, _) => data.amount,
            gradient: kLineGradientContainerCardColor,
          ),
        ],
      ),
    );
  }
}
