import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/dimensions.dart';
import '../../../../constants/styles.dart';

class ContainerPanel extends StatelessWidget {
  const ContainerPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: 350,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(defaultBorderRadius * 4),
              ),
              color: kSecondaryColor,
            ),
          ),
          SizedBox(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(kImgBellingham),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(defaultPadding * 1.5),
            margin: const EdgeInsets.only(top: 30),
            height: 350,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(defaultBorderRadius * 4),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(defaultBorderRadius),
                        ),
                        color: kPurpleAccent,
                      ),
                      child: const Icon(Icons.notifications),
                    ),
                    const SizedBox(width: defaultPadding),
                    Text(
                      '04 12 24',
                      style: kHomeViewNumberTextStyle,
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(defaultBorderRadius),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: kWhiteColor,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(kImgRealMadrid),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Real Madrid',
                            style: kHomeViewTeamNameTextStyle,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(defaultBorderRadius),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: kWhiteColor,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(kImgBarcelona),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Barcelona',
                            style: kHomeViewTeamNameTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                Stack(
                  children: [
                    Container(
                      height: 5,
                      width: double.infinity,
                      color: kPurpleAccent,
                    ),
                    Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width / 3,
                      color: kWhiteColor,
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding * 2),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(defaultBorderRadius * 4),
                          ),
                          border: Border.all(
                            width: 2,
                            color: kWhiteColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: ClipOval(
                                child: Image.asset(
                                  kImgPlayer1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: ClipOval(
                                child: Image.asset(
                                  kImgPlayer2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'RMA 46% 224 Tip',
                              style: kHomeViewGameStatusTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: defaultPadding),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding * 2),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(defaultBorderRadius * 4),
                          ),
                          border: Border.all(
                            width: 2,
                            color: kWhiteColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Draw 24% 98 Tip',
                            style: kHomeViewGameStatusTextStyle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: defaultPadding),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding * 2),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(defaultBorderRadius * 4),
                          ),
                          border: Border.all(
                            width: 2,
                            color: kWhiteColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'FCB 32% 228 Tip',
                              style: kHomeViewGameStatusTextStyle,
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: ClipOval(
                                child: Image.asset(
                                  kImgPlayer3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: ClipOval(
                                child: Image.asset(
                                  kImgPlayer4,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
