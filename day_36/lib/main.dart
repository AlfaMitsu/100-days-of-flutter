import 'package:day_36/src/featutres/todo/presentation/views/intro_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/featutres/todo/data/models/cart_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => CartModel(),
      child:  const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroView(),
      ),
    );
  }
}
