import 'package:day_43/src/constants/colors.dart';
import 'package:day_43/src/features/todo/presentation/widgets/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
        context: context,
        bodyBuilder: (context) => const MenuItems(),
        width: 250,
        height: 150,
        backgroundColor: kTealColor,
      ),
      child: const Icon(Icons.more_vert),
    );
  }
}
