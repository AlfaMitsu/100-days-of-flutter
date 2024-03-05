import 'package:day_16/src/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with TickerProviderStateMixin {
  late AnimationController firstAnimationController;
  late AnimationController secondAnimationController;
  late CurvedAnimation firstCurveAnimation;
  late CurvedAnimation secondCurveAnimation;

  @override
  void initState() {
    firstAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    secondAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    firstCurveAnimation = CurvedAnimation(
      parent: firstAnimationController,
      curve: Curves.easeIn,
    );
    secondCurveAnimation = CurvedAnimation(
      parent: secondAnimationController,
      curve: Curves.easeIn,
    );
    firstAnimationController.repeat();
    secondAnimationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animation'),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          setState(() {
            if (firstAnimationController.isAnimating &&
                secondAnimationController.isAnimating) {
              firstAnimationController.stop();
              secondAnimationController.stop();
            } else {
              firstAnimationController.repeat();
              secondAnimationController.repeat();
            }
          });
        },
        icon: const Icon(
          Icons.apps_sharp,
          size: 32,
          color: kGreyColor,
        ),
      ),
      body: _animationView(),
    );
  }

  Widget _animationView() => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: kLightGreenColor,
        child: Center(
          child: Row(
            children: [
              RotationTransition(
                turns: Tween<double>(begin: 1, end: 0)
                    .animate(firstCurveAnimation),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.settings,
                  size: 190,
                  color: kBlueColor,
                ),
              ),
              RotationTransition(
                turns: Tween<double>(begin: 0, end: 1)
                    .animate(secondCurveAnimation),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.settings,
                  size: 190,
                  color: kBlueColor,
                ),
              ),
            ],
          ),
        ),
      );
  @override
  void dispose() {
    firstAnimationController.dispose();
    secondAnimationController.dispose();
    super.dispose();
  }
}
