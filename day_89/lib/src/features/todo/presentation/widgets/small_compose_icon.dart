import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class SmallComposeIcon extends StatelessWidget {
  const SmallComposeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 254, 215, 227),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: kGreyColor.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      width: 50,
      height: 50,
      child: const Icon(Icons.edit_outlined),
    );
  }
}
