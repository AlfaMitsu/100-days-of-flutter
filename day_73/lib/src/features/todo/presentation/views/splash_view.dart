import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import 'home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/img_main.png"),
            Column(
              children: [
                Text(
                  "Job hunting",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: kPrimaryColor,
                  ),
                ),
                Text(
                  "made easy",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: kSecondaryColor,
                  ),
                ),
              ],
            ),
            MaterialButton(
              color: kSecondaryColor,
              elevation: 10,
              minWidth: 230,
              height: 70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ),
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
                "Get Started",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}