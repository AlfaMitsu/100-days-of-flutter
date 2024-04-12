import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/dimensions.dart';
import '../../../../constants/styles.dart';

class ProfitStatus extends StatelessWidget {
  const ProfitStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      height: 90,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(defaultBorderRadius),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '7:00 PM 12 April 2024',
                style: kHomeViewUserNameTextStyle,
              ),
              Text(
                '+ \$110.23',
                style: kHomeViewProfitTextStyle,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: ClipOval(
                  child: Image.asset(
                    kImgProfile,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding / 2),
                child: Text(
                  'Al-Fasheer A. Hadji Usop',
                  style: kHomeViewNameTextStyle,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 30,
                width: 30,
                child: ClipOval(
                  child: Image.asset(
                    kImgManchesterUnited,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Text(
                  'VS',
                  style: kHomeViewTitleTextStyle,
                ),
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: ClipOval(
                  child: Image.asset(
                    kImgManchesterCity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
