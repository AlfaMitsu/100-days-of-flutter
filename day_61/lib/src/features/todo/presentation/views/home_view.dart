import 'package:day_61/src/constants/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: kWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: kGrey300Color,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: defaultPadding * 2),
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 60,
                                child: ClipOval(
                                  child: Image.asset(
                                    kImgProfile,
                                    scale: 2.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
