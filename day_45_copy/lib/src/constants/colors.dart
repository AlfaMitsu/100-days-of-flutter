import 'package:flutter/material.dart';

// Brand Colors

Color get kPrimary => const Color(0xFF513653);
Color get kPrimaryLight => const Color(0xFFAFDFC7);
Color get kText => const Color(0xFF212121);
Color get kSubTitle => const Color(0xFF212121).withOpacity(0.4);
Color get kColor1 => const Color(0xFF1C4A7E);
Color get kColor2 => const Color(0xFFC65135);
Color get kDColor => const Color(0xFFF3F3F3);
Color get kTextbox => const Color(0xFFEFEFEF).withOpacity(0.6);
List<Color> get kButton => [
      kPrimaryLight,
      kLightGreenColor,
    ];
List<Color> get kSearchBGColor => const [
      Color(0xFF993366),
      Color(0xFF0077C2),
      Color(0xFFFFFF99),
      Color(0xFFFFCC00),
      Color(0xFF333333),
      Color(0xFFC2C2F0),
    ];

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
