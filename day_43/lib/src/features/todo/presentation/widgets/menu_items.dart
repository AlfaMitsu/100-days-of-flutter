import 'package:day_43/src/constants/colors.dart';
import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          color: kTealColor,
          child: const Center(
            child: Text('Profile'),
          ),
        ),
        Container(
          height: 50,
          color: kTealColor,
          child: const Center(
            child: Text('News Feed'),
          ),
        ),
        Container(
          height: 50,
          color: kTealColor,
          child: const Center(
            child: Text('Log Out'),
          ),
        ),
      ],
    );
  }
}
