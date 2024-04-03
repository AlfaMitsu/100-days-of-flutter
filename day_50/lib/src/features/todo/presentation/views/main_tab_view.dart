import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import 'download_view.dart';
import 'home/home_view.dart';
import 'profile_view.dart';
import 'search_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with TickerProviderStateMixin {
  int selectTab = 0;
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller?.addListener(
      () {
        selectTab = controller?.index ?? 0;
        if (mounted) {
          setState(() {});
        }
      },
    );
    FBroadcast.instance().register(
      'change_mode',
      (value, callback) {
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: controller, children: const [
        HomeView(),
        SearchView(),
        DownloadView(),
        ProfileView(),
      ]),
      backgroundColor: kBg,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimary1,
        onPressed: () {
          kTModeDark = !kTModeDark;
          FBroadcast.instance().broadcast('change_mode');
          if (mounted) {
            setState(() {});
          }
        },
        child: Icon(
          kTModeDark ? Icons.light_mode : Icons.dark_mode,
          color: kText,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: kTabBG,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(
                0,
                -3,
              ),
            ),
          ],
        ),
        child: BottomAppBar(
          color: kTransparent,
          elevation: 0,
          child: TabBar(
            controller: controller,
            indicatorWeight: 0.01,
            indicatorColor: kTransparent,
            dividerColor: kTransparent,
            overlayColor: const MaterialStatePropertyAll(kTransparent),
            unselectedLabelStyle: kMainTablViewUnselectedTextStyle,
            labelColor: kPrimary2,
            unselectedLabelColor: kSubtext,
            labelStyle: kMainTablViewSelectedTextStyle,
            tabs: [
              Tab(
                text: 'HOME',
                icon: Image.asset(
                  kImgTabHomeButton,
                  width: 30,
                  height: 30,
                  color: selectTab == 0 ? kPrimary2 : kSubtext,
                ),
              ),
              Tab(
                text: 'SEARCH',
                icon: Image.asset(
                  kImgTabSearchButton,
                  width: 30,
                  height: 30,
                  color: selectTab == 1 ? kPrimary2 : kSubtext,
                ),
              ),
              Tab(
                text: 'DOWNLOAD',
                icon: Image.asset(
                  kImgTabDownloadButton,
                  width: 30,
                  height: 30,
                  color: selectTab == 2 ? kPrimary2 : kSubtext,
                ),
              ),
              Tab(
                text: 'PROFILE',
                icon: Image.asset(
                  kImgTabUserButton,
                  width: 30,
                  height: 30,
                  color: selectTab == 3 ? kPrimary2 : kSubtext,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
