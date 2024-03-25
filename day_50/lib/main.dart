import 'package:flutter/material.dart';

import 'src/features/todo/presentation/views/main_tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Gotham",
        useMaterial3: true,
      ),
      home: const MainTabView(),
    );
  }
}
