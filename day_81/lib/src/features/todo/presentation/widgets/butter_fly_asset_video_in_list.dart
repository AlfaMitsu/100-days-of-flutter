import 'package:flutter/material.dart';

import 'butter_fly_asset_video.dart';
import 'example_card.dart';

class ButterFlyAssetVideoInList extends StatelessWidget {
  const ButterFlyAssetVideoInList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const ExampleCard(title: 'Item A'),
        const ExampleCard(title: 'Item B'),
        const ExampleCard(title: 'Item C'),
        const ExampleCard(title: 'Item D'),
        const ExampleCard(title: 'Item E'),
        const ExampleCard(title: 'Item F'),
        const ExampleCard(title: 'Item G'),
        Card(
            child: Column(children: <Widget>[
          Column(
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.cake),
                title: Text('Video Video'),
              ),
              Stack(
                  alignment: FractionalOffset.bottomRight +
                      const FractionalOffset(-0.1, -0.1),
                  children: <Widget>[
                    const ButterFlyAssetVideo(),
                    Image.asset('lib/src/resources/assets/flutter-mark-square-64.png'),
                  ]),
            ],
          ),
        ])),
        const ExampleCard(title: 'Item H'),
        const ExampleCard(title: 'Item I'),
        const ExampleCard(title: 'Item J'),
        const ExampleCard(title: 'Item K'),
        const ExampleCard(title: 'Item L'),
      ],
    );
  }
}
