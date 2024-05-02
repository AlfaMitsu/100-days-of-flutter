import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final successAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Transaction Completed Successfully!',
          autoCloseDuration: const Duration(seconds: 2),
          showConfirmBtn: false,
        );
      },
      title: 'Success',
      text: 'Transaction Completed Successfully!',
      leadingImage: kImgSuccess,
    );

    final errorAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: 'Sorry, something went wrong',
          backgroundColor: kBlackColor,
          titleColor: kWhiteColor,
          textColor: kWhiteColor,
        );
      },
      title: 'Error',
      text: 'Sorry, something went wrong',
      leadingImage: kImgError,
    );

    final warningAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          text: 'You just broke protocol',
        );
      },
      title: 'Warning',
      text: 'You just broke protocol',
      leadingImage: kImgWarning,
    );

    final infoAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.info,
          text: 'Buy two, get one free',
        );
      },
      title: 'Info',
      text: 'Buy two, get one free',
      leadingImage: kImgInfo,
    );

    final confirmAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          onCancelBtnTap: () {
            Navigator.pop(context);
          },
          context: context,
          type: QuickAlertType.confirm,
          text: 'Do you want to logout',
          titleAlignment: TextAlign.right,
          textAlignment: TextAlign.right,
          confirmBtnText: 'Yes',
          cancelBtnText: 'No',
          confirmBtnColor: kWhiteColor,
          backgroundColor: kBlackColor,
          headerBackgroundColor: kGreyColor,
          confirmBtnTextStyle: kButtonTextStyle, 
          barrierColor: kWhiteColor,
          titleColor: kWhiteColor,
          textColor: kWhiteColor,
        );
      },
      title: 'Confirm',
      text: 'Do you want to logout',
      leadingImage: kImgConfirm,
    );

    final loadingAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.loading,
          title: 'Loading',
          text: 'Fetching your data',
        );
      },
      title: 'Loading',
      text: 'Fetching your data',
      leadingImage: kImgLoading,
    );

    final customAlert = buildButton(
      onTap: () {
        var message = '';
        QuickAlert.show(
          context: context,
          type: QuickAlertType.custom,
          barrierDismissible: true,
          confirmBtnText: 'Save',
          customAsset: kImgCustom,
          widget: TextFormField(
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              hintText: 'Enter Phone Number',
              prefixIcon: Icon(
                Icons.phone_outlined,
              ),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            onChanged: (value) => message = value,
          ),
          onConfirmBtnTap: () async {
            if (message.length < 5) {
              await QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: 'Please input something',
              );
              return;
            }
            Navigator.pop(context);
            if (mounted) {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: "Phone number '$message' has been saved!.",
              );
            }
          },
        );
      },
      title: 'Custom',
      text: 'Custom Widget Alert',
      leadingImage: kImgCustom,
    );

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: kWhiteColor,
        title: Text(
          "QuickAlert Demo",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          successAlert,
          const SizedBox(height: 20),
          errorAlert,
          const SizedBox(height: 20),
          warningAlert,
          const SizedBox(height: 20),
          infoAlert,
          const SizedBox(height: 20),
          confirmAlert,
          const SizedBox(height: 20),
          loadingAlert,
          const SizedBox(height: 20),
          customAlert,
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Card buildButton({
    required onTap,
    required title,
    required text,
    required leadingImage,
  }) {
    return Card(
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            leadingImage,
          ),
        ),
        title: Text(title ?? ""),
        subtitle: Text(text ?? ""),
        trailing: const Icon(
          Icons.keyboard_arrow_right_rounded,
        ),
      ),
    );
  }
}
