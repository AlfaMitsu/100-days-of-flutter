import 'package:day_39/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fractal/flutter_fractal.dart';

import '../../../../constants/styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTealColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(
              '$ChakraLoadingIndicator',
              style: kQiblahTextStyle,
            ),
          ),
          const ChakraLoadingIndicator(),
          Center(
            child: Text(
              '$SlinkyLoadingIndicator',
              style: kQiblahTextStyle,
            ),
          ),
          const SlinkyLoadingIndicator(),
        ],
      ),
    );
  }
}
