import 'package:day_23/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Future<void> _handleRefresh() async {
    return await Future.delayed(
      const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTealColor,
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 300,
                  color: kBlueColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 300,
                  color: kBlueColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 300,
                  color: kBlueColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
