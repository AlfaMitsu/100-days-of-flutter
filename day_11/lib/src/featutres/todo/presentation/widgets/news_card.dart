import 'package:day_11/src/constants/colors.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String image;

  const NewsCard({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Image.asset(image),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PH News",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16 / 2),
                    child: Text(
                      "Best Views you can see in the Philippines",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const Row(
                    children: [
                      Text(
                        "Magagandang Tanawin",
                        style: TextStyle(color: kBlackTextColor),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16 / 2),
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: kGreyColor,
                        ),
                      ),
                      Text(
                        "3m ago",
                        style: TextStyle(color: kGreyTextColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
