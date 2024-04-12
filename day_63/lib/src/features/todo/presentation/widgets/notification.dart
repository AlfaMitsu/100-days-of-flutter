import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class NotificationText extends StatelessWidget {
  const NotificationText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Notification',
          style: kHomeViewFootballGamesTextStyle,
        ),
        Text(
          'News Feed',
          style: kHomeViewAllTextStyle,
        ),
      ],
    );
  }
}
