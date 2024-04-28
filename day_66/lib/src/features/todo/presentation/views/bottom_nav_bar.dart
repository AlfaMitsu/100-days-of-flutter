import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import 'cart_view.dart';
import 'favorite_view.dart';
import 'home_view.dart';
import 'profile_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int cuttentIndex = 2;
  List screens = const [
    Scaffold(),
    FavoriteView(),
    HomeView(),
    CartView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              cuttentIndex = 2;
            },
          );
        },
        shape: const CircleBorder(),
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.home,
          color: kWhiteColor,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: kWhiteColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(
                  () {
                    cuttentIndex = 0;
                  },
                );
              },
              icon: Icon(
                Icons.grid_view_outlined,
                size: 30,
                color: cuttentIndex == 0 ? kPrimaryColor : kGrey300Color,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    cuttentIndex = 1;
                  },
                );
              },
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: cuttentIndex == 1 ? kPrimaryColor : kGrey300Color,
              ),
            ),
            const SizedBox(width: 15),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    cuttentIndex = 3;
                  },
                );
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color: cuttentIndex == 3 ? kPrimaryColor : kGrey300Color,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    cuttentIndex = 4;
                  },
                );
              },
              icon: Icon(
                Icons.person,
                size: 30,
                color: cuttentIndex == 4 ? kPrimaryColor : kGrey300Color,
              ),
            ),
          ],
        ),
      ),
      body: screens[cuttentIndex],
    );
  }
}
