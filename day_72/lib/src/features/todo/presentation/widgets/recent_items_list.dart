import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/models/job_model.dart';

class RecentItemsList extends StatelessWidget {
  final Job job;

  const RecentItemsList({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 8,
            ),
          ],
        ),
        height: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.network(job.urlLogo),
                ),
                recentDetail(context)
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, right: 20),
              child: Icon(
                Icons.favorite_border,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column recentDetail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          job.name,
          style: kJobNameTextStyle,
        ),
        Text(
          job.role,
          style: kJobRole3TextStyle,
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Theme.of(context).highlightColor,
            ),
            const SizedBox(height: 5),
            Text(
              job.location,
              style: kJobLocationTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
