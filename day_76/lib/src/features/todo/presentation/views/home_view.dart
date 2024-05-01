import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/models/facebook_user_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 100,
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(kImgProfile),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(),
                        color: kWhiteColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "What's on your mind?",
                            hintStyle: TextStyle(color: kBlackTextColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.camera_alt,
                    color: kBlackColor,
                    size: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  bottom: 30,
                  top: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Stories',
                          style: kStoriesTextStyle,
                        ),
                        Text('See more    '),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: userInfo.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final user = userInfo[index];
                          return AspectRatio(
                            aspectRatio: 1.6 / 2,
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(user.storyImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: kWhiteColor,
                                          width: 2,
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(user.profileImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      user.name,
                                      textAlign: TextAlign.center,
                                      style: kUserNameTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    for (FacebookUser user in userInfo) userFeed(user)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userFeed(FacebookUser user) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          user.profileImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        textAlign: TextAlign.center,
                        style: kUserName2TextStyle,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        user.time,
                        textAlign: TextAlign.center,
                        style: kUserTimeTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  size: 30,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            user.status,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          user.image != ''
              ? Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(user.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(),
          const SizedBox(height: 10),
          Row(
            children: [
              likeAndLove(kBlueColor, Icons.thumb_up),
              Transform.translate(
                offset: const Offset(-5, 0),
                child: likeAndLove(
                  kRedColor,
                  Icons.favorite,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                user.like,
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              Text(
                '${user.comment} comment',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 10),
              const Text(
                '3 Share',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              likeCommentShare(Icons.thumb_up,
                  user.isOnline == true ? kBlueColor : kGreyColor, 'Like'),
              likeCommentShare(Icons.comment, kGreyColor, 'Comment'),
              likeCommentShare(Icons.chat, kGreyColor, 'Chat'),
            ],
          ),
        ],
      ),
    );
  }

  Container likeCommentShare(icon, color, name) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: color,
            ),
            const SizedBox(width: 5),
            Text(
              name,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }

  Container likeAndLove(color, icon) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: kWhiteColor),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 13,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
