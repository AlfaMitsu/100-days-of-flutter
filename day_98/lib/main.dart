import 'package:flutter/material.dart';

import 'src/features/todo/presentation/views/home_view.dart';
import 'src/features/todo/presentation/widgets/convex_button_demo.dart';
import 'src/features/todo/presentation/widgets/custom_app_bar_demo.dart';
import 'src/features/todo/presentation/widgets/default_app_bar_demo.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (_) => const HomeView(),
        "/bar": (BuildContext context) => const DefaultAppBarDemo(),
        "/custom": (BuildContext context) => const CustomAppBarDemo(),
        "/fab": (BuildContext context) => const ConvexButtonDemo(),
      },
    );
  }
}
