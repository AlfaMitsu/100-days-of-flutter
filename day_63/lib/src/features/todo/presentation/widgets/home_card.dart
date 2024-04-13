import 'package:flutter/material.dart';

import '../../../../constants/dimensions.dart';
import '../../../../constants/styles.dart';
import '../../data/models/home_interior_model.dart';

class HomeCard extends StatelessWidget {
  final HomeInteriorModel homeInterior;

  const HomeCard({
    super.key,
    required this.homeInterior,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: defaultPadding),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            child: Image.asset(
              homeInterior.image,
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding),
            child: Text(
              homeInterior.title,
              style: kHomeCardTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
