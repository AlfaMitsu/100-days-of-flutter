import 'package:flutter/material.dart';

import 'example_app_bar_layout.dart';
import 'hero_photo_view_route_wrapper.dart';

class HeroExample extends StatelessWidget {
  const HeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleAppBarLayout(
      title: "Hero",
      showGoBack: true,
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HeroPhotoViewRouteWrapper(
                  imageProvider: NetworkImage(
                    "https://source.unsplash.com/4900x3600/?camera,paper",
                  ),
                ),
              ),
            );
          },
          child: Hero(
            tag: "someTag",
            child: Image.network(
              "https://source.unsplash.com/4900x3600/?camera,paper",
              width: 350.0,
              loadingBuilder: (_, child, chunk) =>
                  chunk != null ? const Text("loading") : child,
            ),
          ),
        ),
      ),
    );
  }
}
