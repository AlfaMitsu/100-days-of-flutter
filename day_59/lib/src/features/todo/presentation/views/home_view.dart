import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Stack(
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  color: kPurpleColor,
                  borderRadius: BorderRadius.circular(70),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: kPurpleColor,
                    borderRadius: BorderRadius.circular(70),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GlossyContainer(
                  width: 200,
                  height: 200,
                  borderRadius: BorderRadius.circular(12),
                  child: const Center(
                    child: Text(
                      'Glass Morphism',
                      style: kGlassMorphismTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
