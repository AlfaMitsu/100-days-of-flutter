import 'package:flutter/material.dart';

import '../widgets/color_extension.dart';
import '../widgets/recommend_cell.dart';
import '../widgets/user_story_cell.dart';
import 'home/details_view.dart';

class StoriesView extends StatefulWidget {
  const StoriesView({super.key});

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
  List friendsArr = [
    {"name": "James McL..", "image": "lib/src/resources/assets/images/r1.png"},
    {"name": "Bessie Sima...", "image": "lib/src/resources/assets/images/r2.png"},
    {"name": "Jeffery Hall", "image": "lib/src/resources/assets/images/r3.png"},
    {"name": "Judy Adler", "image": "lib/src/resources/assets/images/r4.png"}
  ];

  List storiesArr = [
    {
      "name": "Megan Rae",
      "image": "lib/src/resources/assets/images/s1.png",
      "user_image": "lib/src/resources/assets/images/u1.png"
    },
    {
      "name": "Charles Dixon",
      "image": "lib/src/resources/assets/images/s2.png",
      "user_image": "lib/src/resources/assets/images/u2.png"
    },
    {
      "name": "Rebecca Taylor",
      "image": "lib/src/resources/assets/images/s3.png",
      "user_image": "lib/src/resources/assets/images/u3.png"
    },
    {
      "name": "Deanna Walser",
      "image": "lib/src/resources/assets/images/s4.png",
      "user_image": "lib/src/resources/assets/images/u4.png"
    },
    {
      "name": "Janice Williams",
      "image": "lib/src/resources/assets/images/s5.png",
      "user_image": "lib/src/resources/assets/images/u1.png"
    },
    {
      "name": "Adam Neumann",
      "image": "lib/src/resources/assets/images/s6.png",
      "user_image": "lib/src/resources/assets/images/u2.png"
    },
    {
      "name": "Mary Hennen",
      "image": "lib/src/resources/assets/images/s7.png",
      "user_image": "lib/src/resources/assets/images/u3.png"
    },
    {
      "name": "Joe Terpstra",
      "image": "lib/src/resources/assets/images/s8.png",
      "user_image": "lib/src/resources/assets/images/u4.png"
    },
    {
      "name": "William Yoshioka",
      "image": "lib/src/resources/assets/images/s9.png",
      "user_image": "lib/src/resources/assets/images/u1.png"
    },
    {
      "name": "Megan Rae",
      "image": "lib/src/resources/assets/images/s10.png",
      "user_image": "lib/src/resources/assets/images/u2.png"
    },
    {
      "name": "Charles Dixon",
      "image": "lib/src/resources/assets/images/s11.png",
      "user_image": "lib/src/resources/assets/images/u3.png"
    },
    {
      "name": "Rebecca Taylor",
      "image": "lib/src/resources/assets/images/s12.png",
      "user_image": "lib/src/resources/assets/images/u4.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "lib/src/resources/assets/images/back.png",
            width: 25,
            height: 25,
          ),
        ),
        centerTitle: false,
        title: Text(
          "Stories",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsView(),
                ),
              );
            },
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(17.5),
              child: Image.asset(
                "lib/src/resources/assets/images/user_profile.png",
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset(
                    "lib/src/resources/assets/images/search.png",
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText:
                            "Search friends/or user name to find their stories",
                        hintStyle: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 3, offset: Offset(0, 2))
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Friends",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        scrollDirection: Axis.horizontal,
                        itemCount: friendsArr.length,
                        itemBuilder: (context, index) {
                          var rObj = friendsArr[index] as Map? ?? {};
                          return RecommendCell(
                            rObj: rObj,
                            isActive: true,
                            onPressed: () {},
                          );
                        }),
                  )
                ],
              ),
            ),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 140 / 175),
                itemCount: storiesArr.length,
                itemBuilder: (context, index) {
                  var sObj = storiesArr[index] as Map? ?? {};

                  return UserStoryCell(
                    sObj: sObj,
                  );
                }),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
