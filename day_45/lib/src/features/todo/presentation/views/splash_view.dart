import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/splash_view_model.dart';
import '../../domain/repositories/color_extension.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final splashVM = Get.put(
    SplashViewModel(),
  );

  @override
  void initState() {
    super.initState();
    splashVM.loadView();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.primary,
      body: Center(
        child: Image.asset(
          "lib/src/resources/assets/images/splash_logo.png",
          width: media.width * 0.7,
        ),
      ),
    );
  }
}
