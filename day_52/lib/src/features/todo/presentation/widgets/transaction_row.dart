import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class TransactionRow extends StatelessWidget {
  const TransactionRow({super.key});

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
      child: Row(
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
    );
  }
}
