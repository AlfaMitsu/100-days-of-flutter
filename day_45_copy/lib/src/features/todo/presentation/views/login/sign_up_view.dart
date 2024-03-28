import 'package:day_45_copy/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';
import '../../widgets/round_button.dart';
import '../../widgets/round_text_field.dart';
import 'help_us_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController textFirstName = TextEditingController();
  TextEditingController textEmail = TextEditingController();
  TextEditingController textMobile = TextEditingController();
  TextEditingController textCode = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  bool isStay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign up',
                style: kHelpUsTextStyle,
              ),
              const SizedBox(height: 20),
              RoundTextField(
                controller: textFirstName,
                hintText: 'First & Last Name',
              ),
              const SizedBox(height: 15),
              RoundTextField(
                controller: textEmail,
                hintText: 'Email Address',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              RoundTextField(
                controller: textMobile,
                hintText: 'Mobile Phone',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 15),
              RoundTextField(
                controller: textCode,
                hintText: 'Group Special Code (optional)',
              ),
              const SizedBox(height: 15),
              RoundTextField(
                controller: textPassword,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isStay = !isStay;
                      });
                    },
                    icon: Icon(
                      isStay ? Icons.check_box : Icons.check_box_outline_blank,
                      color: isStay ? kPrimary : kSubTitle.withOpacity(0.3),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Please sign me up for the monthly newsletter.',
                      style: kSignUpTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              RoundLineButton(
                title: 'Sign Up',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpUsView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
