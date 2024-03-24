import 'package:flutter/material.dart';

import '../../widgets/color_extension.dart';
import '../../widgets/home_row.dart';
import '../../widgets/recommend_cell.dart';
import 'chat_view.dart';
import 'details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List recommendationsArr = [
    {"name": "James McL..", "image": "lib/src/resources/assets/images/r1.png"},
    {"name": "Bessie Sima...", "image": "lib/src/resources/assets/images/r2.png"},
    {"name": "Jeffery Hall", "image": "lib/src/resources/assets/images/r3.png"},
    {"name": "Judy Adler", "image": "lib/src/resources/assets/images/r4.png"}
  ];
  List allArr = [
    {
      "name": "Georgia Bates",
      "image": "lib/src/resources/assets/images/u1.png",
      "status": "Toronto, Ontario",
      "is_online": false,
      "time": "30s ago",
      "images": ["lib/src/resources/assets/images/p1.png", "lib/src/resources/assets/images/p2.png", "lib/src/resources/assets/images/p3.png"]
    },
    {
      "name": "Johny Vino",
      "image": "lib/src/resources/assets/images/u2.png",
      "status": "Mississauga, Ontario",
      "time": "5mins ago",
      "is_online": false,
      "images": ["lib/src/resources/assets/images/p4.png", "lib/src/resources/assets/images/p5.png", "lib/src/resources/assets/images/p6.png"]
    },
    {
      "name": "Scott Horsfall",
      "image": "lib/src/resources/assets/images/u3.png",
      "status": "Markham, Ontario",
      "time": "10mins ago",
      "is_online": true,
      "images": ["lib/src/resources/assets/images/p7.png", "lib/src/resources/assets/images/p8.png", "lib/src/resources/assets/images/p9.png"]
    },
    {
      "name": "Meagan Ryan",
      "image": "lib/src/resources/assets/images/u4.png",
      "status": "Oakvill Ontario",
      "time": "2days ago",
      "is_online": false,
      "images": [
        "lib/src/resources/assets/images/p10.png",
        "lib/src/resources/assets/images/p11.png",
        "lib/src/resources/assets/images/p12.png"
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatView(),
              ),
            );
          },
          icon: Image.asset(
            "lib/src/resources/assets/images/chat.png",
            width: 35,
            height: 35,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Logo",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 26,
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
          children: [
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
                      "Recommendations",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        scrollDirection: Axis.horizontal,
                        itemCount: recommendationsArr.length,
                        itemBuilder: (context, index) {
                          var rObj = recommendationsArr[index] as Map? ?? {};
                          return RecommendCell(
                            rObj: rObj,
                            onPressed: () {},
                          );
                        }),
                  )
                ],
              ),
            ),
            ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: allArr.length,
                itemBuilder: (context, index) {
                  var uObj = allArr[index] as Map? ?? {};
                  return HomeRow(
                    uObj: uObj,
                    onPressed: () {},
                  );
                })
          ],
        ),
      ),
    );
  }
}
