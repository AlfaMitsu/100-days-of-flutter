import 'package:flutter/material.dart';

// Brand Colors

const kPageNavigationDuration = Duration(milliseconds: 300);
const kPageNavigationCurve = Curves.easeInOut;

const kButtonDepth = 3.0;
const kButtonBorderWidth = 0.5;
const kButtonAnimationDuration = Duration(milliseconds: 200);

const kBackgroundColor = Color.fromRGBO(13, 13, 13, 1);
const kShadowColorLightGrey = Color.fromRGBO(138, 138, 138, 1);
const kShadowColorGrey = Color.fromRGBO(61, 61, 61, 1);
const kShadowColorWhite = Color.fromRGBO(224, 224, 224, 1);
const kPrimaryButtonColor = Color.fromRGBO(255, 255, 255, 1);
const kSecondaryButtonColor = Color.fromRGBO(0, 0, 0, 1);
const kSecondaryButtonLightColor = Color.fromRGBO(13, 13, 13, 1);
const kPopYellowColor = Color.fromRGBO(255, 235, 52, 1);
const kPlunkColorYellow = Color.fromRGBO(192, 164, 65, 1);
const kShadowColorDarkGreen = Color.fromRGBO(63, 105, 21, 1);
const kShadowColorGreen = Color.fromRGBO(98, 159, 37, 1);
const kBorderColorWhite = Color.fromRGBO(255, 255, 255, 1);
const kBorderColorGreen = Color.fromRGBO(141, 208, 74, 1);
const kShimmerColor = Color.fromRGBO(255, 255, 255, 0.90);
const kCardColor = Color.fromRGBO(39, 72, 6, 1);
const kCardVShadowColor = Color.fromRGBO(29, 55, 3, 1);
const kCardHShadowColor = Color.fromRGBO(64, 100, 28, 1);
const kTiltedButtonShadowColor = Color.fromRGBO(36, 36, 36, 1);

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
const kPurpleColor = Color(0xFFA020F0);

// Text Colors

const kWhiteTextColor = kWhiteColor;
const kGreyTextColor = kGreyColor;
const kBlackTextColor = kBlackColor;

// Widgets Colors

// Gradient Colors

LinearGradient kLineGradientColor = const LinearGradient(
  stops: [
    0.0,
    1,
  ],
  colors: [
    Color.fromARGB(255, 150, 93, 140),
    Color.fromARGB(255, 188, 137, 173),
  ],
);

LinearGradient kLineGradientContainerCardColor = LinearGradient(
  stops: const [
    0.1,
    0.9,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    const Color.fromARGB(255, 255, 209, 150),
    const Color(0xFF383846).withAlpha(150),
  ],
);

// Color shades

const kGrey200Color = Color(0xFFE6E6E6);
const kGrey300Color = Color(0xFFCCCCCC);
const kGrey800Color = Color(0xFF424242);
const kPurpleAccent = Colors.purpleAccent;
