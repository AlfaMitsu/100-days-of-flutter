import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/data.dart';
import '../widgets/selection_button.dart';
import '../widgets/transaction_row.dart';
import 'bar_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectButton = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var barWidth = (size.width / barData.length) - 30;

    var maxVal = barData
        .map(
          (e) =>
              (double.tryParse(e['income'].toString()) ?? 0.0) +
              (double.tryParse(e['expense'].toString()) ?? 0.0),
        )
        .reduce(max);

    return Scaffold(
      backgroundColor: kBg,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectionButton(
                    title: 'Today',
                    isSelect: selectButton == 0,
                    onPressed: () {
                      setState(
                        () {
                          selectButton = 0;
                        },
                      );
                    },
                  ),
                  SelectionButton(
                    title: 'Week',
                    isSelect: selectButton == 1,
                    onPressed: () {
                      setState(
                        () {
                          selectButton = 1;
                        },
                      );
                    },
                  ),
                  SelectionButton(
                    title: 'Month',
                    isSelect: selectButton == 2,
                    onPressed: () {
                      setState(
                        () {
                          selectButton = 2;
                        },
                      );
                    },
                  ),
                  SelectionButton(
                    title: 'Year',
                    isSelect: selectButton == 3,
                    onPressed: () {
                      setState(
                        () {
                          selectButton = 3;
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: barData
                      .map(
                        (cObj) => BarView(
                          cObj: cObj,
                          barWidth: barWidth,
                          maxVal: maxVal,
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: kTransactionCellBg,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Income',
                                style: kHomeViewIncomeCellTextStyle,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: kDropDownIconColor,
                                size: 30,
                              ),
                            ],
                          ),
                          Text(
                            '+\$764.42',
                            style: kHomeViewAddMoneyTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: kBox,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Expense',
                                style: kHomeViewExpenseCellTextStyle,
                              ),
                              Icon(
                                Icons.arrow_drop_up,
                                color: kDropUpIconColor,
                              ),
                            ],
                          ),
                          Text(
                            '-\$654.20',
                            style: kHomeViewMinusMoneyTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Transactions',
                style: kHomeViewTransactionTextStyle,
              ),
              const SizedBox(height: 20),
              Column(
                children: [{}, {}, {}, {}]
                    .map(
                      (cObj) => const TransactionRow(),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
