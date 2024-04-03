import 'package:day_53/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class DevicesCellButton extends StatelessWidget {
  final String name;
  final String img;
  final VoidCallback onPressed;

  const DevicesCellButton({
    super.key,
    required this.name,
    required this.img,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              textAlign: TextAlign.left,
              style: kDevicesCellButtonTextStyle,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  img,
                  width: 80,
                  height: 80,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
