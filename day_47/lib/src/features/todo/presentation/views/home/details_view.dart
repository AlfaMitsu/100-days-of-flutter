import 'package:flutter/material.dart';

import '../../../../../constants/assets.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/styles.dart';
import '../../../data/data_sources/arrays.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            kImgChat,
            width: 35,
            height: 35,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Logo',
          style: kDetailsViewTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(17.5),
              child: Image.asset(
                kImgProfile,
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              kImgProfile,
              width: media.width,
              fit: BoxFit.fitWidth,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: media.width),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '135',
                            style: kDetailsViewNumberTextStyle,
                          ),
                          Text(
                            'posts',
                            style: kDetailsViewPostsTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '5,321k',
                            style: kDetailsViewNumberTextStyle,
                          ),
                          Text(
                            'followers',
                            style: kDetailsViewPostsTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '99',
                            style: kDetailsViewNumberTextStyle,
                          ),
                          Text(
                            'following',
                            style: kDetailsViewPostsTextStyle,
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(17.5),
                        child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadius.circular(17.5),
                          ),
                          child: Text(
                            'Friend Request',
                            style: kDetailsViewFriendRequestsTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: media.width,
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: kBlackColor,
                        blurRadius: 10,
                        offset: Offset(0, -15),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Al-Fasheer Hadji Usop',
                          style: kChatViewActiveTextStyle,
                        ),
                        Row(
                          children: [
                            Text('Creative Designer ',
                                style: kDetailsViewBioTextStyle),
                            Text('@ArgoRadius',
                                style: kDetailsViewBioTextStyle),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            text:
                                "Obsessed with Fahim MD's YouTube channel, love to go shopping on weekends and loveee food ",
                            style: kDetailsViewBioTextStyle,
                            children: [
                              TextSpan(
                                text: '#foodielife',
                                style: kDetailsViewBioTextStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 116 / 100,
                          ),
                          itemCount: imagesArr.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                imagesArr[index] as String? ?? '',
                                height: double.maxFinite,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
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
    );
  }
}
