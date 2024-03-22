import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../view_model/favorite_view_model.dart';
import '../../../domain/repositories/color_extension.dart';
import '../account/account_view.dart';
import '../cart/my_cart_view.dart';
import '../explore/explore_view.dart';
import '../favourite/favourite_view.dart';
import '../home_view/home_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;
  final favVM = Get.put(
    FavoriteViewModel(),
  );

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;

      if (selectTab == 3) {
        favVM.serviceCalList();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: controller, children: const [
        HomeView(),
        ExploreView(),
        MyCartView(),
        FavouriteView(),
        AccountView(),
      ]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 3, offset: Offset(0, -2))
            ]),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: TabBar(
            controller: controller,
            indicatorColor: Colors.transparent,
            indicatorWeight: 1,
            labelColor: TColor.primary,
            labelStyle: TextStyle(
              color: TColor.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelColor: TColor.primaryText,
            unselectedLabelStyle: TextStyle(
              color: TColor.primaryText,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Tab(
                text: "Shop",
                icon: Image.asset(
                  "lib/src/resources/assets/images/store_tab.png",
                  width: 25,
                  height: 25,
                  color: selectTab == 0 ? TColor.primary : TColor.primaryText,
                ),
              ),
              Tab(
                text: "Explore",
                icon: Image.asset(
                  "lib/src/resources/assets/images/explore_tab.png",
                  width: 25,
                  height: 25,
                  color: selectTab == 1 ? TColor.primary : TColor.primaryText,
                ),
              ),
              Tab(
                text: "Cart",
                icon: Image.asset(
                  "lib/src/resources/assets/images/cart_tab.png",
                  width: 25,
                  height: 25,
                  color: selectTab == 2 ? TColor.primary : TColor.primaryText,
                ),
              ),
              Tab(
                text: "Favourite",
                icon: Image.asset(
                  "lib/src/resources/assets/images/fav_tab.png",
                  width: 25,
                  height: 25,
                  color: selectTab == 3 ? TColor.primary : TColor.primaryText,
                ),
              ),
              Tab(
                text: "Account",
                icon: Image.asset(
                  "lib/src/resources/assets/images/account_tab.png",
                  width: 25,
                  height: 25,
                  color: selectTab == 4 ? TColor.primary : TColor.primaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
