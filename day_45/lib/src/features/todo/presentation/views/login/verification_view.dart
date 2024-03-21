import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/forgot_password_view_model.dart';
import '../../../domain/repositories/color_extension.dart';
import '../../widgets/line_text_field.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final forgotVM = Get.put(
    ForgotPasswordViewModel(),
  );

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Stack(children: [
      Container(
        color: Colors.white,
        child: Image.asset("assets/img/bottom_bg.png",
            width: media.width, height: media.height, fit: BoxFit.cover),
      ),
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/img/back.png",
                width: 20,
                height: 20,
              )),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  Text(
                    "Enter your 4-digit code",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                    title: "Code",
                    placeholder: " - - - -",
                    controller: forgotVM.txtResetCode.value,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: media.width * 0.3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            forgotVM.serviceCallRequest(isResend: true);
                          },
                          child: Text(
                            "Resend Code",
                            style: TextStyle(
                                color: TColor.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )),
                      InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          forgotVM.serviceCallVerify();
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: TColor.primary,
                              borderRadius: BorderRadius.circular(30)),
                          child: Image.asset(
                            "assets/img/next.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
