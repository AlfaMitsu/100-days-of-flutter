import 'package:day_73/src/constants/assets.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class ImageSize extends StatelessWidget {
  const ImageSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 90,
              width: 90,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kCardBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: kSelectCardBackgroundColor,
                  width: 1.5,
                ),
              ),
              child: Image.asset(kImgDetail1),
            ),
            Container(
              height: 90,
              width: 90,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kCardBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(kImgDetail2),
            ),
            Container(
              height: 90,
              width: 90,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kCardBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(kImgDetail3),
            ),
            Container(
              height: 90,
              width: 90,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kCardBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(kImgDetail4),
            ),
          ],
        ),
      ),
    );
  }
}
