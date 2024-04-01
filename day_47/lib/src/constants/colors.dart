import 'package:flutter/material.dart';

// Brand Colors

Color get kPrimary => const Color(0xff2676E1);
Color get kPrimaryEnd => const Color(0xff00B5AA);
Color get kSecondary => const Color(0xffA3FEC7);
Color get kSecondaryEnd => const Color(0xff6AC6FC);
Color get kPrimaryText => const Color(0xff434B56);
Color get kPrimaryTextW => const Color(0xffFFFFFF);
Color get kSecondaryText => const Color(0xff7C8085);
Color get kTime => const Color(0xff787C81);
Color get kBase => const Color(0xff00B5AA);
List<Color> get primaryG => [kPrimary, kPrimaryEnd];
List<Color> get secondaryG => [kSecondary, kSecondaryEnd];
Color get kBg => Colors.white;

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

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
