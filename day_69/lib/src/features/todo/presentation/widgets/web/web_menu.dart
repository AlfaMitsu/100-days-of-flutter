import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';

class WebMenu extends StatelessWidget {
  const WebMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

  Container menuItems( title) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: kWebTitleTextStyle,
        ),
      );
  }
}
