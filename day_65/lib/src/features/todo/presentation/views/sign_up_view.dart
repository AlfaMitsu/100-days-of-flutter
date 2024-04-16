import 'package:day_65/src/constants/colors.dart';
import 'package:day_65/src/features/todo/presentation/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

FocusNode f1 = FocusNode();
FocusNode f2 = FocusNode();

final email = TextEditingController();
final password = TextEditingController();

class _SignUpViewState extends State<SignUpView> {
  Future signUp() async {
    var CreateUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(), password: password.text.trim());
  }

  @override
  void initState() {
    super.initState();
    f1.addListener(() {
      setState(() {});
    });
    f2.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kTransparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'Sign up',
                  style: kSignUpTextStyle,
                ),
              ],
            ),
            const SizedBox(height: 100),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Email',
                style: kEmailAndPasswordTextStyle,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.5),
              child: Container(
                color: kContainerColor,
                child: TextField(
                  controller: email,
                  style: kLabelTextStyle,
                  focusNode: f1,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: kLabelTextStyle,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kGrey800Color,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 2,
                        color: kBordercolor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Password',
                style: kEmailAndPasswordTextStyle,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.5),
              child: Container(
                color: kContainerColor,
                child: TextField(
                  controller: password,
                  style: kEmailAndPasswordTextStyle,
                  focusNode: f2,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: kLabelTextStyle,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kGrey800Color,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 2,
                        color: kBordercolor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: InkWell(
                onTap: () => const HomeView(),
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        kTealColor,
                        kBordercolor,
                      ],
                    ),
                  ),
                  child: const Text('Sign up', style: kSignUpTextTextStyle),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account? ',
                    style: kDontHaveAnAccountTextStyle,
                  ),
                  Text(
                    ' Login ',
                    style: kLoginTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
