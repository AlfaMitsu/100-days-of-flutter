import 'package:day_47/src/constants/assets.dart';
import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class UserNotificationRow extends StatelessWidget {
  final Map nObj;

  const UserNotificationRow({
    super.key,
    required this.nObj,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              nObj['image'] as String? ?? '',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nObj['name'] as String? ?? '',
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  style: kChatViewActiveTextStyle,
                ),
                const SizedBox(height: 2),
                Text(
                  '${nObj['message'] as String? ?? ''} | ${nObj['time'] as String? ?? ''} ',
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  style: kHomeRowTextStyle,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              kImgMoreButton,
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
