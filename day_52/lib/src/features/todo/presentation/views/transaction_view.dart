import 'package:flutter/material.dart';

import '../../data/data_sources/data.dart';
import '../widgets/selection_button.dart';
import '../widgets/tab_icon_text_button.dart';
import '../widgets/transaction_list_row.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  int selectButton = 0;

  int selectType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
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
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: selectTypeList.map(
                (sObj) {
                  return TabIconTextButton(
                    title: sObj['name'] as String? ?? '',
                    icon: sObj['icon'] as IconData? ??
                        Icons.arrow_upward_outlined,
                    isSelect: selectType == (sObj['tag'] as int? ?? 0),
                    onPressed: () {
                      setState(
                        () {
                          selectType = sObj['tag'] as int? ?? 0;
                        },
                      );
                    },
                  );
                },
              ).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return const TransactionListRow();
              },
            ),
          ),
        ],
      ),
    );
  }
}
