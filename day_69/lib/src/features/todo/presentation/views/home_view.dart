import 'package:flutter/material.dart';

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
              decoration: BoxDecoration(color: Colors.pink),
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    "images/pets logo.png",
                  ),
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
            // for header parts
            Header(),
            // body parts
            Body(),
            // footer parts
            Footer(),
          ],
        ),
      ),
    );
  }
}