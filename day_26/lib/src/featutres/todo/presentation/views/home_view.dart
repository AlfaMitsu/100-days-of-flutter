import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LikeButton(
          size: 250,
          likeCount: 0,
          countPostion: CountPostion.bottom,
        ),
      ),
    );
  }
}
