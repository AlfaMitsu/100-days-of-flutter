import 'package:flutter/material.dart';

import '../../data/models/item_model.dart';
import '../views/route_detail_view.dart';

class ScreenArguments extends StatelessWidget {
  final Item item;
  final CardSelectedCallback selectCard;
  const ScreenArguments(
      {super.key, required this.item, required this.selectCard});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
