import 'package:day_72/src/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../constants/styles.dart';
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
            customAppBar(),
            welcomText(),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'For You',
                style: kForYouTextStyle,
              ),
            ),
            JobCarousel(jobs: forYou),
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
                'Recent',
                style: kForYouTextStyle,
              ),
              Text(
                'See All',
                style: kSeeAllTextStyle,
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
            'Hi Alfa',
            style: kForYouTextStyle,
          ),
          Text(
            'Find your next',
            style: kFindYourNextTextStyle,
          ),
          Text(
            'design job',
            style: kDesignJobTextStyle,
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
            kIcSlider,
            height: 35,
          ),
          const Spacer(),
          SvgPicture.asset(
            kIcSearch,
            height: 35,
          ),
          const SizedBox(
            width: 20,
          ),
          SvgPicture.asset(
            kIcFilter,
            height: 35,
          ),
        ],
      ),
    );
  }
}
