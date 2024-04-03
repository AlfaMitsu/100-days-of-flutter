import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class RoundIconButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color bgColor;
  final VoidCallback onPressed;

  const RoundIconButton({
    super.key,
    required this.name,
    required this.icon,
    required this.bgColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
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
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: kWhiteColor,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: kRoundIconButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
