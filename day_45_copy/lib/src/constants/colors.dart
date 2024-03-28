import 'package:flutter/material.dart';

// Brand Colors

Color get kPrimary => const Color(0xFF5ABD8C);
Color get kPrimaryLight => const Color(0xFFAFDFC7);
Color get kText => const Color(0xFF212121);
Color get kSubTitle => const Color(0xFF212121).withOpacity(0.4);
Color get kColor1 => const Color(0xFF1C4A7E);
Color get kColor2 => const Color(0xFFC65135);
Color get kDColor => const Color(0xFFF3F3F3);
Color get kTextbox => const Color(0xFFEFEFEF).withOpacity(0.6);
List<Color> get kButton => const [
      Color(0xFF5ABD8C),
      Color(0xFF00FF81),
    ];
List<Color> get kSearchBGColor => const [
      Color(0xFFB7143C),
      Color(0xFFE6A500),
      Color(0xFFEF4C45),
      Color(0xFFF46217),
      Color(0xFF09ADE2),
      Color(0xFFD36A43),
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
