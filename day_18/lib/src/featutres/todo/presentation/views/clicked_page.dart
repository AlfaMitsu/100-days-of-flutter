import 'package:day_18/src/constants/colors.dart';
import 'package:flutter/material.dart';

class ClickedPage extends StatelessWidget {
  const ClickedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clicked Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'tag-1',
              child: Container(
                color: kTealColor,
                height: 200,
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
