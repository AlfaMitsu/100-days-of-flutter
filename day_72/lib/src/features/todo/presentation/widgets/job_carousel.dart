import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../data/models/job_model.dart';
import 'items_jobs.dart';

class JobCarousel extends StatelessWidget {
  final List<Job> jobs;

  const JobCarousel({
    super.key,
    required this.jobs,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: jobs
          .map(
            (e) => ItemsJobs(
              job: e,
              themeDark: jobs.indexOf(e) == 0,
            ),
          )
          .toList(),
      options: CarouselOptions(
        enableInfiniteScroll: false,
        reverse: false,
        viewportFraction: 0.86,
        height: 230,
      ),
    );
  }
}
