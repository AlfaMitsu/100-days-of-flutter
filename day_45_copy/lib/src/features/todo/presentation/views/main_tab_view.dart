import 'package:day_45_copy/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';
import '../../data/data_sources/arrays.dart';
import 'account_view.dart';
import 'home_view.dart';
import 'our_books_view.dart';
import 'search/search_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldKey = GlobalKey<ScaffoldState>();

class _MainTabViewState extends State<MainTabView>
    with TickerProviderStateMixin {
  TabController? controller;

  int selectMenu = 0;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: sideMenuScaffoldKey,
      endDrawer: Drawer(
        backgroundColor: kTransparent,
        elevation: 0,
        width: size.width * 0.8,
        child: Container(
          decoration: BoxDecoration(
            color: kDColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(size.width * 0.7),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 15,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    children: menuArr.map(
                      (mObj) {
                        var index = menuArr.indexOf(mObj);
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 15,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 15,
                          ),
                          decoration: selectMenu == index
                              ? BoxDecoration(
                                  color: kPrimary,
                                  boxShadow: [
                                    BoxShadow(
                                      color: kPrimary,
                                      blurRadius: 10,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                )
                              : null,
                          child: GestureDetector(
                            onTap: () {
                              if (index == 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const OurBooksView(),
                                  ),
                                );
                                sideMenuScaffoldKey.currentState
                                    ?.closeEndDrawer();
                              } else if (index == 7) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AccountView(),
                                  ),
                                );
                                sideMenuScaffoldKey.currentState
                                    ?.closeEndDrawer();
                              }
                              setState(
                                () {
                                  selectMenu = index;
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  mObj['name'].toString(),
                                  style: TextStyle(
                                    color: selectMenu == index
                                        ? kWhiteColor
                                        : kText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Icon(
                                  mObj['icon'] as IconData? ?? Icons.home,
                                  color: selectMenu == index
                                      ? kWhiteColor
                                      : kPrimary,
                                  size: 33,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ).toList()),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          color: kSubTitle,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Terns',
                          style: kMainTabViewTabButtonTextTextStyle,
                        ),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Privacy',
                          style: kMainTabViewTabButtonTextTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          HomeView(),
          SearchView(),
          Scaffold(),
          Scaffold(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: kPrimary,
        child: TabBar(
          controller: controller,
          indicatorColor: kTransparent,
          labelColor: kWhiteColor,
          unselectedLabelColor: Colors.white54,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.search),
              text: 'Search',
            ),
            Tab(
              icon: Icon(Icons.menu),
              text: 'Wishlist',
            ),
            Tab(
              icon: Icon(Icons.shopping_bag),
              text: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}
