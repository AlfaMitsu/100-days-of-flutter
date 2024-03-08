import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:day_25/src/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTealColor,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: kTealColor,
        color: kGreyColor,
        animationDuration: const Duration(milliseconds: 200),
        onTap: (index) {},
        items: const [
          Icon(Icons.home),
          Icon(Icons.favorite),
          Icon(Icons.settings),
        ],
      ),
    );
  }
}
