import 'package:flutter/material.dart';

import 'black_horizontal.dart';
import 'black_vertical.dart';
import 'white_horizontal.dart';
import 'white_vertical.dart';

class AdjacentButtons extends StatelessWidget {
  const AdjacentButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WhiteHorizontal(),
                  BlackHorizontal(),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlackHorizontal(),
                  WhiteHorizontal(),
                ],
              ),
            ],
          ),
        ),
        Spacer(flex: 1),
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    WhiteVertical(),
                    BlackVertical(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    BlackVertical(),
                    WhiteVertical(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
