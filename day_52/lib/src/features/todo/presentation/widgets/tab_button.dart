import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class TabButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isSelect;
  const TabButton(
      {super.key,
      required this.icon,
      required this.isSelect,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: InkWell(
        onTap: onPressed,
        child: Icon(
          icon,
          color: isSelect ? kSecondary : kWhiteColor,
          size: 32,
        ),
      ),
    );
  }
}
