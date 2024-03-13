import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                '\$ 26,830.33',
                style: kWalletBalanceTextStyle,
              ),
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.notifications,
                    color: kGreyColor,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: kWhiteColor,
                    child: ClipOval(
                      child: Image.asset(
                        kImgProfile,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Text(
            'Available Balance',
            style: kWalletAvailableBalanceTextStyle,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.date_range,
                      color: kBlueColor,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Send',
                    style: kWalletFunctionTextStyle,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.public,
                      color: kBlueColor,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Request',
                    style: kWalletFunctionTextStyle,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.attach_money,
                      color: kBlueColor,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Loan',
                    style: kWalletFunctionTextStyle,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.trending_down,
                      color: kBlueColor,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Topup',
                    style: kWalletFunctionTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
