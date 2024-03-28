import 'package:carousel_slider/carousel_slider.dart';
import 'package:day_45_copy/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';
import '../../data/data_sources/arrays.dart';
import '../widgets/best_seller_cell.dart';
import '../widgets/genres_cell.dart';
import '../widgets/recently_cell.dart';
import '../widgets/round_button.dart';
import '../widgets/round_text_field.dart';
import '../widgets/top_picks_cell.dart';
import 'book_reading_view.dart';
import 'login/sing_uv_view.dart';
import 'main_tab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController textName = TextEditingController();
  TextEditingController textEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0, size.width * 0.8),
                    child: Container(
                      width: size.width,
                      height: size.width,
                      decoration: BoxDecoration(
                        color: kPrimary,
                        borderRadius: BorderRadius.circular(size.width * 0.5),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: size.width * 0.1),
                    AppBar(
                      backgroundColor: kTransparent,
                      elevation: 0,
                      title: const Row(
                        children: [
                          Text(
                            'Our Top Picks',
                            style: kTopPicksTextStyle,
                          ),
                        ],
                      ),
                      leading: Container(),
                      leadingWidth: 1,
                      actions: [
                        IconButton(
                          onPressed: () {
                            sideMenuScaffoldKey.currentState?.openEndDrawer();
                          },
                          icon: const Icon(Icons.menu),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.width * 0.8,
                      child: CarouselSlider.builder(
                        itemCount: topPicksArr.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var iObj = topPicksArr[itemIndex] as Map? ?? {};
                          return TopPicksCell(
                            iObj: iObj,
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          viewportFraction: 0.45,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Bestsellers',
                            style: kCategoryTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.9,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 8,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: bestArr.length,
                        itemBuilder: ((context, index) {
                          var bObj = bestArr[index] as Map? ?? {};

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookReadingView(
                                    bObj: bObj,
                                  ),
                                ),
                              );
                            },
                            child: BestSellerCell(
                              bObj: bObj,
                            ),
                          );
                        }),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Genres',
                            style: kCategoryTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.6,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 8,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: genresArr.length,
                        itemBuilder: ((context, index) {
                          var bObj = genresArr[index] as Map? ?? {};

                          return GenresCell(
                            bObj: bObj,
                            bgcolor: index % 2 == 0 ? kColor1 : kColor2,
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: size.width * 0.1),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Recently Viewed',
                            style: kCategoryTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.7,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 8,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: recentArr.length,
                        itemBuilder: ((context, index) {
                          var bObj = recentArr[index] as Map? ?? {};

                          return RecentlyCell(
                            iObj: bObj,
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: size.width * 0.1),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Monthly Newsletter',
                            style: kCategoryTextStyle,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                          color: kTextbox.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Receive our monthly newsletter and receive updates on new stock, books and the occasional promotion.',
                            style: kMonthlyNewsletter,
                          ),
                          const SizedBox(height: 15),
                          RoundTextField(
                            controller: textName,
                            hintText: 'Name',
                          ),
                          const SizedBox(height: 15),
                          RoundTextField(
                            controller: textEmail,
                            hintText: 'Email Address',
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MiniRoundButton(
                                title: 'Sign Up',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpView(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.width * 0.1),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
