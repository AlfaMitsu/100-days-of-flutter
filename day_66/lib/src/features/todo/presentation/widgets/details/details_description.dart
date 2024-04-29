import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/styles.dart';

class Description extends StatelessWidget {
  final String description;

  const Description({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Description',
                style: kFollowTextStyle,
              ),
            ),
            const Text(
              'Specifications',
              style: kCartItemsTitleTextStyle,
            ),
            const Text(
              'Reviews',
              style: kCartItemsTitleTextStyle,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          description,
          style: kDescriptionTextStyle,
        ),
      ],
    );
  }
}
