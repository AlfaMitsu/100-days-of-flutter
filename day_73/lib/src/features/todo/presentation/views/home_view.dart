import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../constants/colors.dart';
import '../../data/models/job_model.dart';
import '../widgets/job_carousel.dart';
import '../widgets/recent_items_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // for menu , search and filter icon
            customAppBar(),
            // for welcome text
            welcomText(),
            // for you
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "For You",
                style: TextStyle(
                  fontSize: 20,
                  color: kSecondaryTextColor,
                ),
              ),
            ),
            JobCarousel(jobs: forYou),
            // for recent
            recentItems()
          ],
        ),
      ),
    );
  }

  Column recentItems() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 5,
            bottom: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent",
                style: TextStyle(
                  fontSize: 20,
                  color: kSecondaryTextColor,
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recent.length,
            itemBuilder: (context, index) {
              return RecentItemsList(job: recent[index]);
            },
          ),
        ),
      ],
    );
  }

  Padding welcomText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi Jade",
            style: TextStyle(
              fontSize: 20,
              color: kSecondaryTextColor,
            ),
          ),
          Text(
            "Find your next",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          Text(
            "design job",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Padding customAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/slider.svg",
            height: 35,
          ),
          const Spacer(),
          SvgPicture.asset(
            "assets/icons/search.svg",
            height: 35,
          ),
          const SizedBox(
            width: 20,
          ),
          SvgPicture.asset(
            "assets/icons/filter.svg",
            height: 35,
          ),
        ],
      ),
    );
  }
}
