import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  const AppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Expense Tracker',
        style: kHomeViewAddMoneyTextStyle,
      ),
      leading: TextButton(
        onPressed: () {},
        child: Icon(
          Icons.more_vert,
          size: 30,
          color: kPrimary,
        ),
      ),
      actions: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            TextButton(
              onPressed: () {},
              child: Icon(
                Icons.notifications_outlined,
                size: 30,
                color: kPrimary,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 15,
                right: 22,
              ),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: kNotificationActive,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ],
      backgroundColor: kAppBarBg,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
