import 'package:flutter/material.dart';

class GalleryExampleItem extends StatelessWidget {
  final String id;
  final String resource;
  final bool isSvg;

  const GalleryExampleItem({
    super.key,
    required this.id,
    required this.resource,
    required this.isSvg,
  });

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

List<GalleryExampleItem> galleryItems = <GalleryExampleItem>[
  const GalleryExampleItem(
    id: "tag1",
    resource: "assets/gallery1.jpg",
    isSvg: true,
  ),
  const GalleryExampleItem(
    id: "tag2",
    resource: "assets/firefox.svg",
    isSvg: true,
  ),
  const GalleryExampleItem(
    id: "tag3",
    resource: "assets/gallery2.jpg",
    isSvg: true,
  ),
  const GalleryExampleItem(
    id: "tag4",
    resource: "assets/gallery3.jpg",
    isSvg: true,
  ),
];
