import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class TransactionListRow extends StatelessWidget {
  const TransactionListRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: kTransactionRowShadow,
            offset: const Offset(
              0,
              7,
            ),
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: kTransactionRowCellBg,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: kPrimary,
                  size: 25,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Buying Blue Dress',
                      maxLines: 1,
                      style: kTransactionRowInfoTextStyle,
                    ),
                    Text(
                      '6/5/2021 4:20pm',
                      maxLines: 1,
                      style: kTransactionRowDateAndTimeTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              const Text(
                '-54\$',
                maxLines: 1,
                style: kTransactionRowExpenseTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.wallet_giftcard_outlined,
                      color: kPrimary,
                      size: 25,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Al-Fasheer',
                      maxLines: 1,
                      style: kUserNameTextStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: kPrimary,
                      size: 25,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Hadji Usop',
                      maxLines: 1,
                      style: kUserNameTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: [
              {'name': 'Buying dress'},
              {'name': 'Wedding'},
              {'name': 'fun'}
            ].map(
              (jObj) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: kTransactionListRowBox,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    jObj['name'].toString(),
                    maxLines: 1,
                    style: kUserNameTextStyle,
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
