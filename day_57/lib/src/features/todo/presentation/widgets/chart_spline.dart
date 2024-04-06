import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/chart_data.dart';
import '../../data/models/chart_spline_model.dart';

class ChartSpline extends StatelessWidget {
  const ChartSpline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
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
        labelPlacement: LabelPlacement.onTicks,
        edgeLabelPlacement: EdgeLabelPlacement.shift,
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
          dataLabelSettings: const DataLabelSettings(
            useSeriesColor: true,
            isVisible: true,
            labelAlignment: ChartDataLabelAlignment.top,
          ),
          xValueMapper: (ChartSplineData data, _) => data.month,
          yValueMapper: (ChartSplineData data, _) => data.amount,
        ),
      ],
    );
  }
}
