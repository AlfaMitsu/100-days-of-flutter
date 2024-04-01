import 'package:day_47/src/constants/assets.dart';
import 'package:day_47/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';
import '../../../data/data_sources/arrays.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
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
                kImgProfile,
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: kWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    offset: Offset(
                      0,
                      2,
                    ),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Recommendations',
                      style: kChatViewActiveTextStyle,
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
                      },
                    ),
                  ),
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
