import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class ChatDateBubble extends StatelessWidget {
  final String date;
  const ChatDateBubble({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 0.5,
              color: kPrimaryText.withOpacity(0.8),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            date,
            textAlign: TextAlign.center,
            style: kCommentViewTextStyle,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              height: 0.5,
              color: kPrimaryText.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
