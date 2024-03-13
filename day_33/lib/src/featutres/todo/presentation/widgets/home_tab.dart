import 'package:flutter/material.dart';

import 'draggable_sheet_home.dart';
import 'profile.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: <Widget>[
        Profile(),
        DraggableSheetHome(),
      ],
    );
  }
}
