import 'package:day_36/src/constants/assets.dart';
import 'package:day_36/src/constants/colors.dart';
import 'package:day_36/src/featutres/todo/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/styles.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 100,
                right: 100,
                top: 120,
                bottom: 20,
              ),
              child: Image.asset(kImgAvocado),
            ),
            Padding(
              padding: const EdgeInsets.all(28),
              child: Text(
                'We deliver groceries at your doorstep',
                textAlign: TextAlign.center,
                style: kGroceryIntroViewTextStyle,
              ),
            ),
            const Text(
              'Fresh items everyday',
              textAlign: TextAlign.center,
              style: kGroceryHeadingIntroViewTextStyle,
            ),
            const SizedBox(height: 24),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomeView();
                  },
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: kBlueColor),
                child: const Text(
                  "Get Started",
                  style: kGrocerySubHeadingIntroviewTextStyle,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
