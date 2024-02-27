import 'dart:async';
import 'dart:math' as math;
import 'package:day_1/src/constants/colors.dart';
import 'package:day_1/src/constants/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyLineChart extends StatefulWidget {
  const MyLineChart({Key? key}) : super(key: key);

  final Color sinColor = kBlueColor;
  final Color cosColor = kPinkColor;

  @override
  State<MyLineChart> createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  final limitCount = 100;
  final sinPoints = <FlSpot>[];
  final cosPoints = <FlSpot>[];

  double X = 0;
  double step = .05;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(milliseconds: 40),
      (timer) {
        while (sinPoints.length > limitCount) {
          sinPoints.removeAt(0);
          cosPoints.removeAt(0);
        }
        setState(
          () {
            sinPoints.add(
              FlSpot(
                X,
                .5 * math.sin(20 * X) + .5 * math.sin(5 * X),
              ),
            );
            cosPoints.add(
              FlSpot(
                X,
                math.cos(X),
              ),
            );
          },
        );
        X += step;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return cosPoints.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Text(
                'X:${X.toStringAsFixed(1)}',
                style: kXTextStyle,
              ),
              Text(
                '.5Sin(20X) + .5sin(5*x):${sinPoints.last.y.toStringAsFixed(1)}',
                style: kXTextStyle,
              ),
              Text(
                'cos(X):${cosPoints.last.y.toStringAsFixed(1)}',
                style: kXTextStyle,
              ),
              const SizedBox(height: 20),
              AspectRatio(
                aspectRatio: 1.5,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: LineChart(
                    LineChartData(
                      minY: -1,
                      maxY: 1,
                      minX: sinPoints.first.x,
                      maxX: sinPoints.last.x,
                      lineTouchData: const LineTouchData(enabled: false),
                      clipData: const FlClipData.all(),
                      gridData: const FlGridData(show: true),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        sinLine(sinPoints),
                        cosLine(cosPoints),
                      ],
                      titlesData: const FlTitlesData(show: false),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container();
  }

  LineChartBarData sinLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points,
      dotData: const FlDotData(show: false),
      gradient: LinearGradient(
        colors: [widget.sinColor.withOpacity(0), widget.sinColor],
        stops: const [.1, 1],
      ),
      barWidth: 5,
      isCurved: false,
    );
  }

  LineChartBarData cosLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points,
      dotData: const FlDotData(show: false),
      gradient: LinearGradient(
        colors: [widget.cosColor.withOpacity(0), widget.cosColor],
        stops: const [.1, 1],
      ),
      barWidth: 5,
      isCurved: false,
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
