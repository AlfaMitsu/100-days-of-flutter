import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../data/models/new_card_skeleton.dart';
import '../widgets/news_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'News App',
          style: TextStyle(color: kBlackTextColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _isLoading
            ? ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) => const NewsCardSkelton(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
              )
            : ListView.separated(
                itemCount: 6,
                itemBuilder: (context, index) => NewsCard(
                  image: "lib/src/resources/assets/images/kImage_$index.jpg",
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
              ),
      ),
    );
  }
}
