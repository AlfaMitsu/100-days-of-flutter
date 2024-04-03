import 'package:flutter/material.dart';

enum Sizes { extraSmall, small, medium, large, extraLarge }

class SegmentedButtonMultipleChoice extends StatefulWidget {
  const SegmentedButtonMultipleChoice({super.key});

  @override
  State<SegmentedButtonMultipleChoice> createState() =>
      _SegmentedButtonMultipleChoiceState();
}

class _SegmentedButtonMultipleChoiceState
    extends State<SegmentedButtonMultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(
          value: Sizes.extraSmall,
          label: Text('XS'),
        ),
        ButtonSegment<Sizes>(
          value: Sizes.small,
          label: Text('S'),
        ),
        ButtonSegment<Sizes>(
          value: Sizes.medium,
          label: Text('M'),
        ),
        ButtonSegment<Sizes>(
          value: Sizes.large,
          label: Text('L'),
        ),
        ButtonSegment<Sizes>(
          value: Sizes.extraLarge,
          label: Text('XL'),
        ),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(
          () {
            selection = newSelection;
          },
        );
      },
      multiSelectionEnabled: true,
    );
  }
}
