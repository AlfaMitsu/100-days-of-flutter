import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

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
            color: const Color.fromARGB(17, 0, 0, 0),
            borderRadius: BorderRadius.circular(36)),
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
                SvgPicture.asset("assets/icons/icon_home.svg"),
                const Spacer(),
              ],
            ),
            Column(
              children: [
                const Spacer(),
                SvgPicture.asset("assets/icons/icon_heart.svg"),
                const Spacer(),
              ],
            ),
            Column(
              children: [
                const Spacer(),
                SvgPicture.asset("assets/icons/icon_cart.svg"),
                const Spacer(),
              ],
            ),
            Column(
              children: [
                const Spacer(),
                SvgPicture.asset("assets/icons/icon_user.svg"),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
