import 'package:day_61/src/features/todo/presentation/widgets/side_main.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/dimensions.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/my_tabs.dart';
import '../widgets/container_panel.dart';

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
                              child: Image.asset(kImgSpain),
                            ),
                          ],
                        ),
                      ],
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
}
