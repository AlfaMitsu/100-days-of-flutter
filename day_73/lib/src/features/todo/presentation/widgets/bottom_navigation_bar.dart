import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';

class BottomNaigationBar extends StatelessWidget {
  const BottomNaigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  width: 30,
                  height: 3,
                  color: kSecondaryColor,
                ),
                const Spacer(),
                SvgPicture.asset(kIcHome),
                const Spacer(),
              ],
            ),
            Column(
              children: [
                const Spacer(),
                SvgPicture.asset(kIcHeart),
                const Spacer(),
              ],
            ),
            Column(
              children: [
                const Spacer(),
                SvgPicture.asset(kIcCart),
                const Spacer(),
              ],
            ),
            Column(
              children: [
                const Spacer(),
                SvgPicture.asset(kIcUser),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
