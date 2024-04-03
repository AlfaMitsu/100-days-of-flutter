import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class TabIconTextButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isSelect;

  const TabIconTextButton(
      {super.key,
      required this.title,
      required this.icon,
      this.isSelect = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: isSelect ? kPrimary : kWhiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: isSelect
                  ? null
                  : [
                      BoxShadow(
                        color: kTransactionRowShadow.withOpacity(0.8),
                        offset: const Offset(
                          0,
                          4,
                        ),
                        blurRadius: 10,
                      ),
                    ],
            ),
            child: Icon(
              icon,
              color: isSelect ? kWhiteColor : kPrimary,
              size: 35,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: kTabIconTextButtonTextStyle,
          ),
        ],
      ),
    );
  }
}
