import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/repositories/color_extension.dart';
import '../../view_model/my_details_view_model.dart';
import '../../widgets/line_text_field.dart';
import '../../widgets/round_button.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final detailVM = Get.put(MyDetailViewModel());

  @override
  void initState() {
    super.initState();
    detailVM.clearPassword();
  }

  @override
  void dispose() {
    Get.delete<MyDetailViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/back.png",
              width: 20,
              height: 20,
            )),
        centerTitle: true,
        title: Text(
          "Change Password",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Column(
                children: [
                  LineTextField(
                      title: "Current Password",
                      placeholder: "Enter you current password",
                      obscureText: true,
                      controller: detailVM.txtCurrentPassword.value),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                      title: "New Password",
                      placeholder: "Enter you new password",
                      obscureText: true,
                      controller: detailVM.txtNewPassword.value),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                      title: "Confirm Password",
                      obscureText: true,
                      placeholder: "Enter you Confirm password",
                      controller: detailVM.txtConfirmPassword.value),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title: "Set",
                  onPressed: () {
                    detailVM.serviceCallSetPassword(() {
                      Navigator.pop(context);
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
