import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double height;

  const RoundButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: kPrimaryG,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(9),
          boxShadow: kTModeDark
              ? null
              : [
                  BoxShadow(
                    color: kPrimary1.withOpacity(0.5),
                    blurRadius: 6,
                    offset: const Offset(
                      0,
                      4,
                    ),
                  ),
                ],
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: kRoundButtonTextStyle,
        ),
      ),
    );
  }
}
