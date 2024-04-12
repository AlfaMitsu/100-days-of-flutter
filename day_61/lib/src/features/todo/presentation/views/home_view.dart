import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/dimensions.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/chart_data.dart';
import '../../data/data_sources/my_tabs.dart';
import '../../data/models/spain_model.dart';
import '../widgets/container_panel.dart';
import '../widgets/side_main.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            flex: 1,
            child: SideMain(),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: defaultPadding * 2,
                      left: defaultPadding,
                      right: defaultPadding,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding),
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(defaultBorderRadius),
                                    ),
                                    color: kWhiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kGrey200Color,
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    initialValue: 'Search Games...',
                                    style: const TextStyle(color: kGreyColor),
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.search,
                                        color: kBlackColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: defaultPadding * 2),
                              Container(
                                padding: const EdgeInsets.all(4),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: kBlackColor,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: Image.asset(kImgPremierLeague),
                                ),
                              ),
                              const SizedBox(width: defaultPadding),
                              Container(
                                padding: const EdgeInsets.all(4),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: kBlackColor,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: Image.asset(kImgLaLiga),
                                ),
                              ),
                              const SizedBox(width: defaultPadding),
                              Container(
                                padding: const EdgeInsets.all(4),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: kBlackColor,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: Image.asset(kImgChampionsLeague),
                                ),
                              ),
                              const SizedBox(width: defaultPadding * 2),
                              SizedBox(
                                height: 40,
                                width: 150,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: kSecondaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          defaultBorderRadius),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Add Tips +',
                                    style: TextStyle(
                                      color: kWhiteTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          const ContainerPanel(),
                          const SizedBox(height: defaultPadding),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Football Games',
                                style: kHomeViewFootballGamesTextStyle,
                              ),
                              Container(
                                height: 30,
                                width: 130,
                                decoration: const BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(22),
                                  ),
                                ),
                                child: Center(
                                  child: DropdownButton(
                                    underline: Container(),
                                    iconEnabledColor: kBlackColor,
                                    iconDisabledColor: kBlackColor,
                                    value: 'More Bets',
                                    items: [
                                      DropdownMenuItem(
                                        value: 'More Bets',
                                        child: Text(
                                          'More Bets',
                                          style: kHomeViewDropdownMenuTextStyle,
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding * 2),
                          SizedBox(
                            width: double.infinity,
                            child: MaterialSegmentedControl(
                              children: myTabs,
                              selectionIndex: segmentedControlGroupValue,
                              selectedColor: kSecondaryColor,
                              unselectedColor: kBgColor,
                              selectedTextStyle:
                                  const TextStyle(color: kWhiteColor),
                              unselectedTextStyle:
                                  const TextStyle(color: kBlackColor),
                              borderColor: kTransparent,
                              borderRadius: 5,
                              borderWidth: 0,
                              verticalOffset: 0,
                              horizontalPadding:
                                  const EdgeInsets.only(left: 0, right: 0),
                              onSegmentTapped: (index) {
                                setState(
                                  () {
                                    segmentedControlGroupValue = index;
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: defaultPadding),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: kGrey300Color,
                          ),
                          const SizedBox(height: defaultPadding),
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 30,
                                child: Image.asset(
                                  kImgSpain,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: defaultPadding),
                                child: Text(
                                  'Spain',
                                  style: kHomeViewDropdownMenuTextStyle,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                  kImgLaLiga,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: defaultPadding),
                                child: Text(
                                  'LaLiga',
                                  style: kHomeViewDropdownMenuTextStyle,
                                ),
                              ),
                              const Spacer(flex: 2),
                              const Icon(
                                Icons.expand_less,
                                color: kBlackColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          SizedBox(
                            height: spain.length * 80,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: spain.length,
                              itemBuilder: (context, index) {
                                return gamesList(
                                  spain[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding gamesList(SpainModel spain) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 6),
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(defaultBorderRadius),
          ),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '3:00',
                        style: kHomeViewDropdownMenuTextStyle,
                      ),
                      Text(
                        '12 April',
                        style: kHomeViewGameDateTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(width: defaultPadding * 1.5),
                  Container(
                    height: 20,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(defaultBorderRadius / 2),
                      ),
                      color: kRedColor,
                    ),
                    child: Center(
                      child: Text(
                        'Live',
                        style: kHomeViewLiveTextStyle,
                      ),
                    ),
                  ),
                  const SizedBox(width: defaultPadding * 1.5),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: ClipOval(
                      child: Image.asset(spain.image1),
                    ),
                  ),
                  const SizedBox(width: defaultPadding * 1.5),
                  Text(
                    spain.title1,
                    style: kHomeViewDropdownMenuTextStyle,
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '3 : 2',
                      style: kHomeViewScoreTextStyle,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: SfCircularChart(
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                          dataSource: chartData,
                          innerRadius: '90%',
                          radius: '220%',
                          startAngle: 0,
                          endAngle: 90,
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.level,
                          yValueMapper: (ChartData data, _) => data.y,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: defaultPadding * 2,
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: ClipOval(
                      child: Image.asset(spain.image2),
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  Text(
                    spain.title2,
                    style: kHomeViewDropdownMenuTextStyle,
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: ClipOval(
                      child: Image.asset(spain.player1),
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: ClipOval(
                      child: Image.asset(spain.player2),
                    ),
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
