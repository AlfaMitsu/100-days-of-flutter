import 'package:day_15/src/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double width = 150;
  double height = 100;
  Color color = kBlueColor;
  double opacity = 0.2;
  CrossFadeState state = CrossFadeState.showFirst;
  double beginValue = 100;
  double endValue = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animations'),
      ),
      body: _body(),
    );
  }

  Widget _body() => Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _animatedContainerButton(),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: _animatedOpacityButton(),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _animatedCrossFadeButton(),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: _animatedTweenButton(),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
                curve: Curves.easeInBack,
              ),
              const SizedBox(height: 20),
              AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: kTealColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedCrossFade(
                firstChild: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: kRedColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                secondChild: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: kTealColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                crossFadeState: state,
                firstCurve: Curves.bounceOut,
                secondCurve: Curves.easeIn,
                duration: const Duration(seconds: 1),
              ),
              const SizedBox(height: 20),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 100, end: endValue),
                duration: const Duration(seconds: 1),
                curve: Curves.ease,
                builder: ((context, _, child) => Container(
                      width: endValue,
                      height: beginValue,
                      decoration: BoxDecoration(
                        color: kLightGreenColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )),
              ),
            ],
          ),
        ),
      );

  Widget _animatedContainerButton() => ElevatedButton(
        onPressed: () {
          setState(() {
            width = width == 150 ? 100 : 150;
            height = height == 100 ? 150 : 100;
            color = color == kBlueColor ? kPinkColor : kBlueColor;
          });
        },
        child: const Text('Container Animated'),
      );

  Widget _animatedOpacityButton() => ElevatedButton(
        onPressed: () {
          setState(() {
            opacity = opacity == 0.2 ? 1 : 0.2;
          });
        },
        child: const Text('Opacity Animated'),
      );

  Widget _animatedCrossFadeButton() => ElevatedButton(
        onPressed: () {
          setState(
            () {
              state = state == CrossFadeState.showFirst
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst;
            },
          );
        },
        child: const Text('Cross Fade Animated'),
      );

  Widget _animatedTweenButton() => ElevatedButton(
        onPressed: () {
          setState(() {
            endValue = endValue == 150 ? 250 : 150;
          });
        },
        child: const Text('Tween Animated'),
      );
}
