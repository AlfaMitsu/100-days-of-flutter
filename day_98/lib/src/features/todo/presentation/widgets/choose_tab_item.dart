import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/choice_value_model.dart';
import 'radio_item.dart';

class ChooseTabItem extends StatelessWidget {
  final List<ChoiceValue<List<TabItem>>> tabTypes;
  final ChoiceValue<List<TabItem>> selectedType;
  final ValueChanged<ChoiceValue<List<TabItem>>?>? onChanged;

  const ChooseTabItem({
    super.key,
    required this.tabTypes,
    required this.selectedType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: tabTypes.map<Widget>((ChoiceValue<List<TabItem>> type) {
        return Expanded(
          child: RadioItem<List<TabItem>>(
            value: type,
            groupValue: selectedType,
            onChanged: onChanged,
          ),
        );
      }).toList(),
    );
  }
}
