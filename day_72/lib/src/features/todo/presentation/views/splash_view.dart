import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import 'home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: kWhiteColor,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(kImgSplash),
            Column(
              children: [
                Text(
                  'Job hunting',
                  style: kJobHuntingTextStyle,
                ),
                Text(
                  'made easy',
                  style: kDesignJobTextStyle,
                ),
              ],
            ),
            MaterialButton(
              color: kSecondaryColor,
              elevation: 10,
              minWidth: 230,
              height: 70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
              child: const Text(
                'Get Started',
                style: kGettingStarted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
