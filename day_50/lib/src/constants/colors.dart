import 'package:flutter/material.dart';

// Brand Colors

bool kTModeDark = true;
Color get kPrimary1 => const Color(0xFFFFBB3B);
Color get kPrimary2 => const Color(0xFFFFA90A);
List<Color> get kPrimaryG => [kPrimary1, kPrimary2];
Color get kBgDark => const Color(0xFF000000);
Color get kBgLight => const Color(0xFFF5F5F5);
Color get kBg => kTModeDark ? kBgDark : kBgLight;
Color get kBgText => kTModeDark ? kBgLight : kBgDark;
Color get kCardDark => const Color(0xFF212121);
Color get kCardLight => const Color(0xFFFFFFFF);
Color get kCardLightGry => const Color(0xFFE8E8E8);
Color get kCard => kTModeDark ? kCardDark : kCardLight;
Color get kCastBG => kTModeDark ? kCardDark : kCardLightGry;
Color get kTabBGDark => const Color(0xFF1A1A1A);
Color get kTabBGLight => const Color(0xFFFFFFFF);
Color get kTabBG => kTModeDark ? kTabBGDark : kTabBGLight;
Color get kTextDark => const Color(0xFFFFFFFF);
Color get kTextLight => const Color(0xFF5A5A5A);
Color get kText => kTModeDark ? kTextDark : kTextLight;
Color get kBtnText => kTModeDark ? kBgDark : kCardLight;
Color get kTextOpacity => (kText).withOpacity(0.6);
Color get kSubtextDark => const Color(0xFFA2A2A2);
Color get kSubtextLight => const Color(0xFFA2A2A2);
Color get kSubtext => kTModeDark ? kSubtextDark : kSubtextLight;

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
