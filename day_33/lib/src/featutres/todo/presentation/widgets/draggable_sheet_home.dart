import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class DraggableSheetHome extends StatelessWidget {
  const DraggableSheetHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Recent Transactions',
                        style: kWalletRecentTransactionTextStyle,
                      ),
                      Text(
                        'See all',
                        style: kWalletSeeAllTextStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
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
                            )
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: const Text(
                          'All',
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
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: const Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: kLightGreenColor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Income',
                              style: kWalletTransactionsTextStyle,
                            ),
                          ],
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
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: const Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: kRedColor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Expenses',
                                style: kWalletTransactionsTextStyle),
                          ],
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
                  child: const Text(
                    'TODAY',
                    style: kWalletTransactionsTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32),
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                              color: kGrey200Color,
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(
                              Icons.date_range,
                              color: kBlueColor,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Payment',
                                  style: kWalletTransactionsTitleTextStyle,
                                ),
                                Text(
                                  'Payment from Saad',
                                  style: kWalletTransactionSenderTextStyle,
                                ),
                              ],
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                '+\$500.00',
                                style: kWalletPlusMoneyTextStyle,
                              ),
                              Text(
                                '14 Mar',
                                style: kWalletTransactionSenderTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  shrinkWrap: true,
                  itemCount: 5,
                  padding: const EdgeInsets.all(0),
                  controller: ScrollController(keepScrollOffset: false),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: const Text(
                    'YESTERDAY',
                    style: kWalletTransactionsTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32),
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                              color: kGrey200Color,
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(
                              Icons.directions_car,
                              color: kBlueColor,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Petrol',
                                  style: kWalletTransactionsTitleTextStyle,
                                ),
                                Text(
                                  'Payment from Saad',
                                  style: kWalletTransactionSenderTextStyle,
                                ),
                              ],
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                '-\$500.00',
                                style: kWalletMinusMoneyTextStyle,
                              ),
                              Text(
                                '13 Mar',
                                style: kWalletTransactionSenderTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  shrinkWrap: true,
                  itemCount: 5,
                  padding: const EdgeInsets.all(0),
                  controller: ScrollController(keepScrollOffset: false),
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
