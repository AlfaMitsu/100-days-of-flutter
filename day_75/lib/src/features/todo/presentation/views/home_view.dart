import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../widgets/my_line_chart.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage(kImgProfile),
                  radius: 20,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style: kTodayTextStyle,
                ),
                Text(
                  'Apr 30, 2024',
                  style: kDateTextStyle,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                fitnessItems(
                  0,
                  Colors.deepOrange,
                  Icons.favorite_border,
                  'Heart',
                  '80',
                  'Per min',
                ),
                fitnessItems(
                  1,
                  kPrimaryColor,
                  Icons.crisis_alert_sharp,
                  'Calories',
                  '950',
                  'Kcal',
                ),
                fitnessItems(
                  2,
                  Colors.orangeAccent,
                  Icons.nightlight_round_outlined,
                  'Sleep',
                  '8:30',
                  'Hours',
                ),
                fitnessItems(
                  4,
                  Colors.deepPurple,
                  Icons.timer_sharp,
                  'Training',
                  '2:00',
                  'Hours',
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Stack(
              children: [
                Positioned(
                  left: 80,
                  top: 50,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: SfRadialGauge(
                      axes: [
                        RadialAxis(
                          axisLineStyle: const AxisLineStyle(
                            thickness: 0.2,
                            thicknessUnit: GaugeSizeUnit.factor,
                            cornerStyle: CornerStyle.bothCurve,
                          ),
                          showTicks: false,
                          showLabels: false,
                          pointers: const [
                            RangePointer(
                              color: kPrimaryColor,
                              value: 80,
                              cornerStyle: CornerStyle.bothCurve,
                              width: 0.2,
                              sizeUnit: GaugeSizeUnit.factor,
                            ),
                          ],
                          annotations: const [
                            GaugeAnnotation(
                              widget: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2.0',
                                    style: k30DaysTextStyle,
                                  ),
                                  Text(
                                    'KM',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              positionFactor: 0.1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: SfRadialGauge(
                      axes: [
                        RadialAxis(
                          axisLineStyle: const AxisLineStyle(
                            thickness: 0.15,
                            thicknessUnit: GaugeSizeUnit.factor,
                            cornerStyle: CornerStyle.bothCurve,
                          ),
                          showTicks: false,
                          showLabels: false,
                          pointers: const [
                            RangePointer(
                              color: kSecondaryColor,
                              value: 65,
                              cornerStyle: CornerStyle.bothCurve,
                              width: 0.15,
                              sizeUnit: GaugeSizeUnit.factor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 140,
                  child: Image.asset(
                    kImgRunning,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            child: const Stack(
              clipBehavior: Clip.none,
              children: [
                MyLineChart(),
                Positioned(
                  top: -10,
                  left: 90,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: kSecondaryColor,
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 15,
                  right: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1km',
                        style: kProgressTextStyle,
                      ),
                      Text(
                        '2km',
                        style: kProgressTextStyle,
                      ),
                      Text(
                        '3km',
                        style: kProgressTextStyle,
                      ),
                      Text(
                        '4km',
                        style: kProgressTextStyle,
                      ),
                      Text(
                        '5km',
                        style: kProgressTextStyle,
                      ),
                      Text(
                        '6km',
                        style: kProgressTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const SizedBox(
        height: 90,
        child: BottomAppBar(
          color: kPrimaryColor,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 160,
                top: 0,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: kSecondaryColor,
                  child: Icon(
                    Icons.add,
                    color: kWhiteColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 12,
                  left: 15,
                  right: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.house_outlined,
                      color: kWhiteColor,
                      size: 30,
                    ),
                    Icon(
                      Icons.line_axis_rounded,
                      color: kWhiteColor,
                      size: 30,
                    ),
                    SizedBox(width: 40),
                    Icon(
                      Icons.favorite_border,
                      color: kWhiteColor,
                      size: 30,
                    ),
                    Icon(
                      Icons.person_outline,
                      color: kWhiteColor,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded fitnessItems(int index, color, icon, name, value, unit) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          border: Border.all(
            color: currentIndex == index ? kSecondaryColor : kTransparent,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Icon(
                icon,
                color: kWhiteColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: kNameTextStyle,
            ),
            Text(
              value,
              style: kNameTextStyle,
            ),
            Text(
              unit,
              style: kUnitTextStyle, 
            ),
          ],
        ),
      ),
    );
  }
}
