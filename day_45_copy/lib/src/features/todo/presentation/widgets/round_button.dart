import 'package:day_45_copy/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const RoundButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: kWhiteColor,
      color: kPrimary,
      height: 50,
      minWidth: double.maxFinite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        title,
        style: kRoundButtonTextStyle,
      ),
    );
  }
}

class RoundLineButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const RoundLineButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: getColor(
          kWhiteColor,
          kPrimary,
        ),
        foregroundColor: getColor(
          kPrimary,
          kWhiteColor,
        ),
        shadowColor: MaterialStateProperty.resolveWith((states) => kPrimary),
        minimumSize: MaterialStateProperty.resolveWith(
          (states) => const Size(double.maxFinite, 50),
        ),
        elevation: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.pressed) ? 1 : 0),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              width: 1,
              color: states.contains(MaterialState.pressed)
                  ? kTransparent
                  : kPrimary,
            ),
          ),
        ),
      ),
      child: Text(
        title,
        style: kRoundButtonTextStyle,
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    return MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.pressed) ? colorPressed : color);
  }
}

class MiniRoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const MiniRoundButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => kPrimary),
        foregroundColor:
            MaterialStateProperty.resolveWith((states) => kWhiteColor),
        shadowColor: MaterialStateProperty.resolveWith((states) => kPrimary),
        minimumSize: MaterialStateProperty.resolveWith(
          (states) => const Size(
            150,
            35,
          ),
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Text(
        title,
        style: kRoundButton2TextStyle,
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    return MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.pressed) ? colorPressed : color);
  }
}
