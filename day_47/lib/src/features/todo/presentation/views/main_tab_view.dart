import 'package:day_47/src/constants/assets.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../widgets/tab_button.dart';
import 'home/home_view.dart';
import 'notifications_view.dart';
import 'post/create_post_view.dart';
import 'search_view.dart';
import 'stories_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index.round() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: const [
          HomeView(),
          StoriesView(),
          NotificationsView(),
          SearchView()
        ],
      ),
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(35),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePostView(),
            ),
          );
        },
        child: Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: kPrimaryG,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(
              color: kWhiteColor,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(
                  0,
                  5,
                ),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Image.asset(
            kImgPhotoCenter,
            width: 30,
            height: 30,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: kWhiteColor,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                title: 'HOME',
                icon: kImgHomeTabButton,
                isSelect: selectTab == 0,
                onPressed: () {
                  setState(() {
                    controller?.index = 0;
                  });
                },
              ),
              TabButton(
                title: 'STORIES',
                icon: kImgStoriesTabButton,
                isSelect: selectTab == 1,
                onPressed: () {
                  setState(
                    () {
                      controller?.index = 1;
                    },
                  );
                },
              ),
              const SizedBox(width: 20),
              TabButton(
                title: 'NOTIFICATIONS',
                icon: kImgNotificationTabButton,
                isSelect: selectTab == 2,
                onPressed: () {
                  setState(
                    () {
                      controller?.index = 2;
                    },
                  );
                },
              ),
              TabButton(
                title: 'SEARCH',
                icon: kImgSearchTabButton,
                isSelect: selectTab == 3,
                onPressed: () {
                  setState(
                    () {
                      controller?.index = 3;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
