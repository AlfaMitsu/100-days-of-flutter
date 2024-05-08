import 'package:flutter/material.dart';

import '../../data/models/choice_value_model.dart';

// copy of _RadioItem from flutter gallery
class RadioItem<T> extends StatelessWidget {
  final ChoiceValue<T> value;
  final ChoiceValue<T> groupValue;
  final ValueChanged<ChoiceValue<T>?>? onChanged;

  const RadioItem({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsetsDirectional.only(start: 16.0),
      alignment: AlignmentDirectional.centerStart,
      child: MergeSemantics(
        child: Row(
          children: <Widget>[
            Radio<ChoiceValue<T>>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Expanded(
              child: Semantics(
                container: true,
                button: true,
                label: value.label,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (onChanged != null) {
                      onChanged!(value);
                    }
                  },
                  child: Text(value.title),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
