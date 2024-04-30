import 'package:day_71/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/styles.dart';
import '../../data/models/leaderboard_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                child: Column(
                  children: [
                    Image.asset(
                      kImgLeaderboard,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 25,
                      child: Image.asset(
                        kImgLine,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: userItems.length,
                itemBuilder: (context, index) {
                  final items = userItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      bottom: 15,
                    ),
                    child: Row(
                      children: [
                        Text(
                          items.rank,
                          style: kItemsRankTextStyle,
                        ),
                        const SizedBox(width: 15),
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(items.image),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          items.name,
                          style: kItemsNameTextStyle,
                        ),
                        const Spacer(),
                        Container(
                          height: 25,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 5),
                              const RotatedBox(
                                quarterTurns: 1,
                                child: Icon(
                                  Icons.back_hand,
                                  color: kYellowColor,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                items.point.toString(),
                                style: kItemsPointTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const Positioned(
            top: 70,
            right: 150,
            child: Text(
              'Leaderboard',
              style: kLeaderboardTextStyle,
            ),
          ),
          const Positioned(
            top: 120,
            left: 10,
            child: Text(
              'Ends in 2d 23Hours',
              style: kLeaderboardTimerTextStyle,
            ),
          ),
          Positioned(
            top: 150,
            right: 125,
            child: rank(
              radius: 50,
              height: 15,
              image: kImgSkem,
              name: 'GeekFam.Skem',
              point: '10,094',
            ),
          ),
          Positioned(
            top: 240,
            left: 5,
            child: rank(
              radius: 30.0,
              height: 10,
              image: kImgNatsumi,
              name: 'GeekFam.Natsumi-',
              point: '11,230',
            ),
          ),
          Positioned(
            top: 263,
            right: 50,
            child: rank(
              radius: 30.0,
              height: 10,
              image: kImgKarl,
              name: '747.Karl',
              point: '8709',
            ),
          ),
        ],
      ),
    );
  }

  Column rank({
    required double radius,
    required double height,
    required String image,
    required String name,
    required String point,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(image),
        ),
        SizedBox(height: height),
        Text(
          name,
          style: kNameTextStyle,
        ),
        SizedBox(height: height),
        Container(
          height: 25,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              const SizedBox(width: 5),
              const Icon(
                Icons.back_hand,
                color: kYellowColor,
              ),
              const SizedBox(width: 5),
              Text(
                point,
                style: kPointTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
