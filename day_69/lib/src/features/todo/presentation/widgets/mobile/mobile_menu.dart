import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';

class MobileMenu extends StatelessWidget {
  const MobileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        menuItems('Dots'),
        menuItems('Cats'),
        menuItems('Pig'),
        menuItems('Birds'),
        menuItems('Fish'),
        menuItems('Cow'),
      ],
    );
  }

  Container menuItems(title) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: kMobileTitleTextStyle,
      ),
    );
  }
}
