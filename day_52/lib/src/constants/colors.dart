import 'package:flutter/material.dart';

// Brand Colors

Color get kPrimary => const Color(0xFF4530B3);
Color get kSecondary => const Color(0xFF1FD2FF);
Color get kBg => kWhiteColor;
Color get kAppBarBg => kWhiteColor;
Color get kNotificationActive => const Color(0xFFFAAC38);
Color get kTransactionCellBg => const Color(0xFFECE9FF);
Color get kIncome => const Color(0xFF958BCE);
Color get kDropDownIconColor => const Color(0xFF02C487);
Color get kBox => const Color(0xFFEBFBFF);
Color get kExpense => const Color(0xFF71C1D5);
Color get kDropUpIconColor => const Color(0xFFFC6158);
Color get kTransactionRowShadow => const Color(0xFFD4CEFE);
Color get kTransactionRowCellBg => const Color(0xFFFFE5F3);
Color get kTransactionRowText => const Color(0xFF5C5C5C);
Color get kTransactionRowDateAndTime => const Color(0xFF5C5C5C);
Color get kTabIconTextButton => const Color(0xFF747474);

// Common Colors

const kWhiteColor = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF000000);
const kGreyColor = Color(0xFF808080);
const kBlueColor = Color(0xFF0000FF);
const kPinkColor = Color(0xFFFFC0CB);
const kTealColor = Color(0xFF23B6E6);
const kLightGreenColor = Color(0xFF02D39A);
const kRedColor = Color(0xFFFF0000);
const kTransparent = Colors.transparent;
const kYellowColor = Color(0xFFFFFF00);
const kBrownColor = Color(0xFF964B00);

// Text Colors

const kWhiteTextColor = kWhiteColor;
const kGreyTextColor = kGreyColor;
const kBlackTextColor = kBlackColor;

// Widgets Colors

const kBlueGreyColor = Color(0xFF7393B3);
const kIconColor = Color(0xFF4E4F53);
const kCardColor = Color.fromRGBO(35, 60, 103, 1);
const kCardSettingsSwitch = Color.fromRGBO(50, 172, 121, 1);

// Gradient Colors

LinearGradient kLineGradientColor = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.5, 1],
  colors: [
    Colors.redAccent,
    Colors.orangeAccent,
  ],
);

// Color shades

const kGrey200Color = Color(0xFFE6E6E6);
const kGrey300Color = Color(0xFFCCCCCC);
const kGrey800Color = Color(0xFF424242);
