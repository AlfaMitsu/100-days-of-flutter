import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool a = true;
  void to() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LoginView(to);
    } else {
      return SignUpView(to);
    }
  }
}
