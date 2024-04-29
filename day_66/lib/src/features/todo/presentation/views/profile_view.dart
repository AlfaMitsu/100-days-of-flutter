import 'package:day_66/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            kImgProfile3,
            fit: BoxFit.cover,
            height: size.height,
            width: size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: size.height * 0.4,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  children: [
                                    const CircleAvatar(
                                      radius: 42,
                                      backgroundImage: AssetImage(kImgProfile3),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kLightGreenColor,
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          color: kWhiteColor,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border:
                                            Border.all(color: Colors.black54),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 9,
                                        horizontal: 12,
                                      ),
                                      child: const Text(
                                        'ADD FRIEND',
                                        style: kFavoriteItemsPriceTextStyle,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: kPinkColor,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 12,
                                      ),
                                      child: const Text(
                                        'Follow',
                                        style: kFollowTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Al-Fasheer Hadji Usop',
                              style: kProfileNameTextStyle,
                            ),
                            const Text(
                              'Flutter Developer',
                              style: kJobStatusTextStyle,
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "A Flutter developer is a software engineer who has proficiency with the Flutter framework to develop mobile, web,",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Divider(color: Colors.black12),
                      SizedBox(
                        height: 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            friendAndMore('FRIENDS', '2318'),
                            friendAndMore('FOLLOWING', '364'),
                            friendAndMore('FOLLOWER', '175'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox friendAndMore(title, number) {
    return SizedBox(
      width: 110,
      child: Column(
        children: [
          Text(
            title,
            style: kTitleTextStyle,
          ),
          Text(
            number,
            style: kNumberTextStyle,
          ),
        ],
      ),
    );
  }
}
