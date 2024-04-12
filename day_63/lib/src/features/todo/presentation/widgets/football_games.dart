import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class FootballGames extends StatelessWidget {
  const FootballGames({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Football Games',
          style: kHomeViewFootballGamesTextStyle,
        ),
        Container(
          height: 30,
          width: 130,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
          ),
          child: Center(
            child: DropdownButton(
              underline: Container(),
              iconEnabledColor: kBlackColor,
              iconDisabledColor: kBlackColor,
              value: 'More Bets',
              items: [
                DropdownMenuItem(
                  value: 'More Bets',
                  child: Text(
                    'More Bets',
                    style: kHomeViewDropdownMenuTextStyle,
                  ),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}
