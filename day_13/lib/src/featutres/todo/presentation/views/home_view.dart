import 'dart:async';

import 'package:day_13/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../constants/styles.dart';

class HomeView extends StatefulWidget {
  final String? phoneNumber;

  const HomeView({
    super.key,
    this.phoneNumber,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: <Widget>[
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Phone Number Verification',
              style: kPinCodeFieldsTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: RichText(
              text: TextSpan(
                text: "Enter the code sent to ",
                children: [
                  TextSpan(
                    text: "${widget.phoneNumber}",
                    style: kPhoneNumberTextStyle,
                  ),
                ],
                style: kPhoneNumberTextStyle,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 30,
              ),
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: kVerifyTextStyle,
                length: 6,
                obscureText: true,
                obscuringCharacter: '&',
                obscuringWidget: const Icon(
                  Icons.lock,
                  size: 24,
                  color: kLightGreenColor,
                ),
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 6) {
                    return "OTP must be of 6 digits";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: kWhiteColor,
                ),
                cursorColor: kBlackColor,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: kBlackColor,
                    blurRadius: 10,
                  )
                ],
                onCompleted: (v) {
                  debugPrint("Completed");
                },
                onTap: () {
                  print("Pressed");
                },
                onChanged: (value) {
                  debugPrint(value);
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  debugPrint("Allowing to paste $text");
                  print('123123');
                  return true;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              hasError ? "*Please fill up all the cells properly" : "",
              style: kReminderTextStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Didn't receive the code? ",
                style: kBottomTitlesTextStyle,
              ),
              TextButton(
                onPressed: () => snackBar("OTP resend!!"),
                child: const Text(
                  "RESEND",
                  style: kResendTextStyle,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
            decoration: BoxDecoration(
                color: kLightGreenColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      color: kLightGreenColor,
                      offset: Offset(1, -2),
                      blurRadius: 5),
                  BoxShadow(
                      color: kLightGreenColor,
                      offset: Offset(-1, 2),
                      blurRadius: 5)
                ]),
            child: ButtonTheme(
              height: 50,
              child: TextButton(
                onPressed: () {
                  formKey.currentState!.validate();
                  if (currentText.length != 6 || currentText != "123456") {
                    errorController!.add(ErrorAnimationType.shake);
                    setState(() => hasError = true);
                  } else {
                    setState(
                      () {
                        hasError = false;
                        snackBar("OTP Verified!!");
                      },
                    );
                  }
                },
                child: Center(
                  child: Text(
                    "VERIFY".toUpperCase(),
                    style: kVerifyTextTextStyle,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            child: const Text("Clear"),
            onPressed: () {
              textEditingController.clear();
            },
          ),
        ],
      ),
    );
  }
}
