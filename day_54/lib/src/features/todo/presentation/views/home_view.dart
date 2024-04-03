import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/arrays.dart';
import '../widgets/tasks_row.dart';
import '../widgets/top_progress_row.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Hello, Al-Fasheer!',
                            style: kHomeViewUserTextStyle,
                          ),
                        ),
                        CircleAvatar(
                          radius: 33,
                          child: Image.asset(kImgProfile),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'You progress',
                      style: kHomeViewProgressTextStyle,
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: topProgressArr.length,
                      itemBuilder: (context, index) {
                        var tObj = topProgressArr[index] as Map? ?? {};
                        return TopProgressRow(
                          tObj: tObj,
                          bgColor: index == 0 ? kColor1 : kColor2,
                          textColor: index == 0 ? kColor1Text : kColor2Text,
                          isActivePadding: index == 0,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Wednesday, March 7',
                            style: kHomeViewDateAndTimeTextStyle,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: kBox,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Icon(
                            Icons.today,
                            color: kPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: taskArr.map(
                        (tObj) {
                          var index = taskArr.indexOf(tObj);
                          return TaskRow(
                            tObj: tObj,
                            index: index,
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    15,
                    0,
                    15,
                    8,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectTab = 0;
                          });
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: kTransparent,
                            context: context,
                            builder: (context) {
                              return Container(
                                margin: const EdgeInsets.all(25),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: kBox,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.close,
                                              color: kPrimary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      kImgCoffee,
                                      fit: BoxFit.fitWidth,
                                      width: 160,
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      'Oh, you need\nsome rest!',
                                      textAlign: TextAlign.center,
                                      style: kHomeViewAlertTextStyle,
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      'Coffee machine can make\n a cappuccino especially for you in\n5 minutes. Do you want some coffee?',
                                      textAlign: TextAlign.center,
                                      style: kHomeViewInfoTextStyle,
                                    ),
                                    const SizedBox(height: 50),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: kPrimary),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(
                                                    10,
                                                  ),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'No, later',
                                                  style:
                                                      kHomeViewProgressTextStyle,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: kColor2,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Yes thanks!',
                                                  style:
                                                      kHomeViewThanksMessageTextStyle,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.apps,
                          size: 25,
                          color: selectTab == 0 ? kWhiteColor : Colors.white54,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              selectTab = 1;
                            },
                          );
                        },
                        icon: Icon(
                          Icons.calendar_today,
                          size: 25,
                          color: selectTab == 1 ? kWhiteColor : Colors.white54,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              selectTab = 2;
                            },
                          );
                        },
                        icon: Icon(
                          Icons.today,
                          size: 25,
                          color: selectTab == 2 ? kWhiteColor : Colors.white54,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              selectTab = 3;
                            },
                          );
                        },
                        icon: Icon(
                          Icons.forum,
                          size: 25,
                          color: selectTab == 3 ? kWhiteColor : Colors.white54,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              selectTab = 4;
                            },
                          );
                        },
                        icon: Icon(
                          Icons.settings,
                          size: 25,
                          color: selectTab == 4 ? kWhiteColor : Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
