import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/dimensions.dart';
import '../../../../constants/styles.dart';
import '../../data/models/devices_model.dart';
import '../../data/models/home_interior_model.dart';
import '../widgets/devices_card.dart';
import '../widgets/home_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical: defaultPadding * 2,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Hello Al-Fasheer',
                      style: kHomeViewGreetingTextStyle,
                    ),
                  ),
                  const Icon(
                    Icons.settings_outlined,
                    color: kBlackColor,
                    size: 30,
                  ),
                  const SizedBox(width: defaultPadding),
                  const Icon(
                    Icons.notifications_outlined,
                    color: kBlackColor,
                    size: 30,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: defaultPadding * 1.5),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: homeInterior.length,
                  itemBuilder: (context, index) {
                    return HomeCard(homeInterior: homeInterior[index]);
                  },
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  dotColor: kGreyColor.withOpacity(0.3),
                  activeDotColor: kSecondaryColor,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical: defaultPadding,
              ),
              child: Text(
                'My Devices',
                style: kHomeViewMyDevicesTextStyle,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeDevices.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return DevicesCard(homeDevices: homeDevices[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        color: kBgColor,
        padding: const EdgeInsets.all(10),
        child: TabBar(
          labelColor: kSecondaryColor,
          unselectedLabelColor: kUnselectedLabelColor,
          controller: _tabController,
          indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
          tabs: const [
            ImageIcon(
              AssetImage(kIcHome),
              size: 35,
            ),
            ImageIcon(
              AssetImage(kIcSearch),
              size: 35,
            ),
            ImageIcon(
              AssetImage(kIcDashboard),
              size: 35,
            ),
            ImageIcon(
              AssetImage(kIcAccount),
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
