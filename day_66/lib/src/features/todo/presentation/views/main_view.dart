import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_view.dart';
import 'home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeView();
          } else {
            return const AuthView();
          }
        },
      ),
    );
  }
}
