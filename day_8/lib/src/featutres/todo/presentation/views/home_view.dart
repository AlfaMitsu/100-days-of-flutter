import 'package:day_8/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int count = 0;

  increase() {
    count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badges'),
        centerTitle: true,
        backgroundColor: kTealColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Badge(
              alignment: Alignment.topRight,
              largeSize: 40,
              label: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  '$count',
                  style: kBadgeTextStyle,
                ),
              ),
              child: const Icon(
                Icons.shopping_cart_rounded,
                size: 80,
                color: kGreyColor,
              ),
            ),
          ),
          const SizedBox(height: 70),
          Center(
            child: Badge(
              alignment: Alignment.topRight,
              largeSize: 40,
              label: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  '$count',
                  style: kBadgeTextStyle,
                ),
              ),
              child: const Icon(
                Icons.facebook,
                size: 80,
                color: kBlueColor,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => increase(),
        child: const Icon(
          Icons.trending_up,
        ),
      ),
    );
  }
}
