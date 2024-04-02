import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';
import 'user_notification_row.dart';

class NotificationSectionRow extends StatelessWidget {
  final Map sObj;
  const NotificationSectionRow({super.key, required this.sObj});

  @override
  Widget build(BuildContext context) {
    var nArr = sObj['list'] as List? ?? [];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            sObj['name'] as String? ?? '',
            style: kChatViewMyChatsTextStyle,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: nArr.length,
            itemBuilder: (context, index) {
              var nObj = nArr[index] as Map? ?? {};
              return UserNotificationRow(
                nObj: nObj,
              );
            },
          ),
          const Divider()
        ],
      ),
    );
  }
}
