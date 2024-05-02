import 'package:flutter/material.dart';

import 'small_compose_icon.dart';

class MediumComposeIcon extends StatelessWidget {
  const MediumComposeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 18),
          child: const Icon(Icons.menu),
        ),
        const SmallComposeIcon(),
      ],
    );
  }
}
