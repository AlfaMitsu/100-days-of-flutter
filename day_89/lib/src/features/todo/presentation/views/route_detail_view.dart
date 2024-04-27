import 'package:flutter/material.dart';

import '../../data/models/item_model.dart';
import '../widgets/detail_tile.dart';

typedef CardSelectedCallback = void Function(int?);

class RouteDetailView extends StatelessWidget {
  final Item item;
  final CardSelectedCallback selectCard;

  const RouteDetailView(
      {super.key, required this.item, required this.selectCard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {
                Navigator.popUntil(context,
                    (Route<dynamic> route) => route.settings.name == '/');
                selectCard(null);
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Expanded(child: DetailTile(item: item)),
        ],
      ),
    );
  }
}
