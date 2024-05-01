import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/models/user_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chat',
                    style: kTitle2TextStyle,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.search,
                    size: 40,
                  ),
                  const SizedBox(width: 15),
                  const CircleAvatar(
                    backgroundImage: AssetImage(kImgProfile),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              personalAndGroup(size),
              Expanded(
                child: ListView.builder(
                  itemCount: userItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final chat = userItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black12.withOpacity(0.05),
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(chat.image),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat.name,
                                  style: kChatNameTextStyle,
                                ),
                                Text(
                                  chat.message,
                                  style: kChatMessageTextStyle,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: chat.currentMesage == true
                                    ? kPinkColor
                                    : kTransparent,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: bottomParts(size),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: kPrimaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: kWhiteColor,
        ),
      ),
    );
  }

  Container bottomParts(Size size) {
    return Container(
      height: size.height * 0.12,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 10,
            blurRadius: 10,
            offset: Offset(3, 10),
          ),
        ],
        color: kWhiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Icon(
                  Icons.chat,
                  size: 50,
                ),
                Text(
                  'Chats',
                  style: kBottomNavigationBarTextStyle,
                ),
              ],
            ),
            Column(
              children: [
                const Icon(
                  Icons.call,
                  size: 50,
                ),
                Text(
                  'Calls',
                  style: kBottomNavigationBar2TextStyle,
                ),
              ],
            ),
            Column(
              children: [
                const Icon(
                  Icons.group,
                  size: 50,
                ),
                Text(
                  'Contacts',
                  style: kBottomNavigationBar2TextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding personalAndGroup(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 70,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: kSecondaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 5,
            left: 10,
          ),
          child: Row(
            children: [
              Container(
                height: 55,
                width: size.width / 2.6,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Center(
                  child: Text(
                    'Personal',
                    style: kPersonalTextStyle,
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                'Groups',
                style: kPersonalTextStyle,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
