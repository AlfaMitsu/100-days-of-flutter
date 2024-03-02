import 'package:flutter/material.dart';

import 'skeleton.dart';

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Skeleton(
          height: 120,
          width: 120,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(width: 80),
              SizedBox(height: 16 / 2),
              Skeleton(),
              SizedBox(height: 16 / 2),
              Skeleton(),
              SizedBox(height: 16 / 2),
              Row(
                children: [
                  Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Skeleton(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
