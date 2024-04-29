import 'package:day_69/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../widgets/body.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/mobile/mobile_menu.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: kPinkColor),
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(kImgLogo),
                ),
              ),
            ),
            MobileMenu(),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Body(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
