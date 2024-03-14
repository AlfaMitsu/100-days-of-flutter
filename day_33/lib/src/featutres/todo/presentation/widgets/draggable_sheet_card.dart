import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class DraggableSheetCard extends StatefulWidget {
  const DraggableSheetCard({
    super.key,
  });

  @override
  State<DraggableSheetCard> createState() => _DraggableSheetCardState();
}

class _DraggableSheetCardState extends State<DraggableSheetCard> {
  bool switchValueCardSettings = false;
  bool switchValueOnlinePayment = false;
  bool switchValueAtmWithdraws = false;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 24,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Your Cards',
                            style: kWalletRecentTransactionTextStyle,
                          ),
                          Text(
                            '2 Physical Card, and 1 Virtual Card',
                            style: kWalletCardTextStyle,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz,
                          color: kBlueColor,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: kGrey200Color,
                              blurRadius: 10,
                              spreadRadius: 4.5,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: const Text(
                          'Physical Card',
                          style: kWalletTransactionsTextStyle,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: kGrey200Color,
                              blurRadius: 10,
                              spreadRadius: 4.5,
                            )
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: const Text(
                          'Virtual Card',
                          style: kWalletTransactionsTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: kCardColor,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: kLightGreenColor,
                            child: Icon(
                              Icons.check,
                              color: kWhiteColor,
                              size: 24,
                            ),
                          ),
                          Text(
                            'VISA',
                            style: kWalletVisaTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        '**** **** **** 5647',
                        style: kWalletCardNumberTextStyle,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'CARD HOLDER',
                                style: kWalletCardDetailsTextStyle,
                              ),
                              Text(
                                'Alfa Mitsu',
                                style: kWalletCardSubDetailsTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('EXPIRES',
                                  style: kWalletCardDetailsTextStyle),
                              Text('8/22',
                                  style: kWalletCardSubDetailsTextStyle),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('CVV', style: kWalletCardDetailsTextStyle),
                              Text(
                                '845"',
                                style: kWalletCardSubDetailsTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: const Text(
                    'Card Settings',
                    style: kWalletCardSettingsTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: kGrey200Color,
                        spreadRadius: 10,
                        blurRadius: 4.5,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Row(
                        children: <Widget>[
                          Icon(
                            Icons.wifi_tethering,
                            color: kBlueColor,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Card Settings',
                            style: kWalletTransactionsTitleTextStyle,
                          ),
                        ],
                      ),
                      Switch(
                        value: switchValueCardSettings,
                        activeColor: kCardSettingsSwitch,
                        onChanged: (value) {
                          setState(() {
                            switchValueCardSettings = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: kGrey200Color,
                        spreadRadius: 10,
                        blurRadius: 4.5,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Row(
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            color: kBlueColor,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Online Payment',
                            style: kWalletTransactionsTitleTextStyle,
                          )
                        ],
                      ),
                      Switch(
                        value: switchValueOnlinePayment,
                        activeColor: kCardSettingsSwitch,
                        onChanged: (value) {
                          setState(() {
                            switchValueOnlinePayment = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: kGrey200Color,
                        spreadRadius: 10,
                        blurRadius: 4.5,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Row(
                        children: <Widget>[
                          Icon(
                            Icons.mobile_screen_share,
                            color: kBlueColor,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text('ATM Withdraws',
                              style: kWalletTransactionsTitleTextStyle),
                        ],
                      ),
                      Switch(
                        value: switchValueAtmWithdraws,
                        activeColor: kCardSettingsSwitch,
                        onChanged: (value) {
                          setState(() {
                            switchValueAtmWithdraws = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      initialChildSize: 0.65,
      minChildSize: 0.65,
      maxChildSize: 1,
    );
  }
}
