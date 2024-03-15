import 'package:day_35/src/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final child;
  const HomeView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      margin: const EdgeInsets.all(40),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kGrey800Color,
        boxShadow: [
          BoxShadow(
              color: kGrey800Color,
              offset: Offset(
                4,
                4,
              ),
              blurRadius: 15,
              spreadRadius: 1),
          BoxShadow(
            color: kGrey300Color,
            offset: Offset(-4, -4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kGrey200Color,
            kGrey300Color,
            kGrey800Color,
            kGreyColor,
          ],
          stops: [
            0.1,
            0.3,
            0.8,
            1,
          ],
        ),
      ),
      child: child,
    );
  }
}
