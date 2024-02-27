import 'package:flutter/material.dart';

import 'src/featutres/todo/presentation/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '100 days of Flutter',
      home: HomeView(),
    );
  }
}