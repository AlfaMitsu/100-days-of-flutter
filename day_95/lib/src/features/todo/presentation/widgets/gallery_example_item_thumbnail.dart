import 'package:flutter/material.dart';

import 'gallery_example_item.dart';

class GalleryExampleItemThumbnail extends StatelessWidget {
  final GalleryExampleItem galleryExampleItem;
  final GestureTapCallback onTap;

  const GalleryExampleItemThumbnail({
    super.key,
    required this.galleryExampleItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryExampleItem.id,
          child: Image.asset(galleryExampleItem.resource, height: 80.0),
        ),
      ),
    );
  }
}
