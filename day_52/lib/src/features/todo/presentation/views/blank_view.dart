import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class BlankView extends StatefulWidget {
  const BlankView({super.key});

  @override
  State<BlankView> createState() => _BlankViewState();
}

class _BlankViewState extends State<BlankView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kWhiteColor,
    );
  }
}
