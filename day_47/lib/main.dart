import 'package:flutter/material.dart';

import 'src/constants/colors.dart';
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimary,
        ),
        useMaterial3: false,
      ),
      home: const MainTabView(),
    );
  }
}
