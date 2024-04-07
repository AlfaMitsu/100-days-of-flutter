import 'package:flutter/material.dart';

class MainSideModel {
  final String title;
  final IconData icon;
  final int index;

  MainSideModel({
    required this.title,
    required this.icon,
    required this.index,
  });
}

List mainSide = [
  MainSideModel(
    icon: Icons.dashboard_outlined,
    title: "Dashboard",
    index: 0,
  ),
  MainSideModel(
    icon: Icons.feed_outlined,
    title: "My Feed",
    index: 1,
  ),
  MainSideModel(
    icon: Icons.filter_alt_outlined,
    title: "Tipstres",
    index: 2,
  ),
  MainSideModel(
    icon: Icons.send_outlined,
    title: "Hot Tips",
    index: 3,
  ),
];
