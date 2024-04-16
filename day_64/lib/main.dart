import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'src/features/todo/data/models/app_model.dart';
import 'src/features/todo/presentation/views/home_view.dart';

GetIt getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<AppModel>(AppModelImplementation(),
      signalsReady: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(title: 'Get It'),
    );
  }
}
