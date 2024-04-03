import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class SelectionButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isSelect;

  const SelectionButton(
      {super.key,
      required this.title,
      required this.isSelect,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: isSelect
          ? BoxDecoration(
              color: kPrimary,
              borderRadius: BorderRadius.circular(10),
            )
          : BoxDecoration(
              border: Border.all(color: kPrimary),
              borderRadius: BorderRadius.circular(10),
            ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: isSelect ? kWhiteColor : kPrimary,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
