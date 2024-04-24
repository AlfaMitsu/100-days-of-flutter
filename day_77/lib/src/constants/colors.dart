import 'package:flutter/material.dart';

// Brand Colors

Color kPrimaryColor = const Color(0xFF9D0DA2);
Color kSecondaryColor = const Color(0xFFFAC2FC);
Color kTextColor = const Color(0xFF343434);

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
