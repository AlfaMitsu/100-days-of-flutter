import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

import '../../../../constants/colors.dart';
import 'black_button.dart';

class ConfigureButtons extends StatelessWidget {
  const ConfigureButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 190,
      height: 190,
      child: NeoPopCard(
        color: kCardColor,
        depth: kButtonDepth,
        vShadowColor: kCardVShadowColor,
        hShadowColor: kCardHShadowColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlackButton(position: Position.topLeft),
                SizedBox(height: 10),
                BlackButton(position: Position.centerLeft),
                SizedBox(height: 10),
                BlackButton(position: Position.bottomLeft),
              ],
            ),
            Expanded(child: SizedBox()),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlackButton(position: Position.topCenter),
                SizedBox(height: 10),
                BlackButton(position: Position.center),
                SizedBox(height: 10),
                BlackButton(position: Position.bottomCenter),
              ],
            ),
            Expanded(child: SizedBox()),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlackButton(position: Position.topRight),
                SizedBox(height: 10),
                BlackButton(position: Position.centerRight),
                SizedBox(height: 10),
                BlackButton(position: Position.bottomRight),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
