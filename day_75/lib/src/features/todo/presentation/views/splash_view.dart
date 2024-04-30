import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import 'home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset(
              kImgSplash,
              height: size.height * 0.68,
              fit: BoxFit.fill,
              width: size.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.75,
                    child: const Text(
                      '30 Days Fitness\nChallenge',
                      style: k30DaysTextStyle,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Track your fitness level by our smart Mobile App, Calories sleep and training.',
                    style: kTrackYourFitnessTextStyle,
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ),
                        );
                      },
                      child: Material(
                        elevation: 15,
                        shadowColor: kPrimaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(200),
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundColor: kPrimaryColor,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
