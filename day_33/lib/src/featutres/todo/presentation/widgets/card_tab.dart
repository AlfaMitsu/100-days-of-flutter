import 'package:day_33/src/featutres/todo/presentation/widgets/profile.dart';
import 'package:flutter/material.dart';

import 'draggable_sheet_card.dart';

class CardTab extends StatelessWidget {
  const CardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Profile(),
        DraggableSheetCard(),
      ],
    );
  }
}
