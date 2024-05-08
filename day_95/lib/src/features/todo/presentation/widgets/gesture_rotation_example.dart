import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import 'example_app_bar_layout.dart';

class GestureRotationExample extends StatelessWidget {
  const GestureRotationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleAppBarLayout(
      title: "Rotation Examples",
      showGoBack: true,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              "Example using option enableRotation, just pinch an rotate",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 300.0,
              child: ClipRect(
                child: PhotoView(
                  imageProvider: const AssetImage("assets/large-image.jpg"),
                  maxScale: PhotoViewComputedScale.covered,
                  initialScale: PhotoViewComputedScale.contained * 0.8,
                  enableRotation: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
