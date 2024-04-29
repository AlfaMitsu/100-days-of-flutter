import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Image.asset(
            kImgCare,
            height: 230,
            width: 230,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Care & Healthy Pets',
              style: kCareAndHealthyPetsTextStyle,
            ),
          ),
          const Text(
            'Pets are domesticated animals kept primarily for companionship, pleasure, or as a hobby, rather than for work or food production. They play significant roles in the lives of many people, providing companionship, emotional support, and sometimes even therapeutic benefits. Pets come in various shapes, sizes, and species. Common types of pets include dogs, cats, birds, fish, rabbits,',
            textAlign: TextAlign.center,
            style: kDescriptionTextStyle,
          ),
        ],
      ),
    );
  }
}
