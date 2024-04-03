import 'package:day_53/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class DetailCellButton extends StatelessWidget {
  final String name;
  final String val;
  final IconData icon;
  final Color bgColor;
  final VoidCallback onPressed;

  const DetailCellButton(
      {super.key,
      required this.name,
      required this.val,
      required this.icon,
      required this.bgColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              textAlign: TextAlign.left,
              style: kDetailCellButtonNameTextStyle,
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    val,
                    textAlign: TextAlign.left,
                    style: kDetailCellButtonValueTextStyle,
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: bgColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
