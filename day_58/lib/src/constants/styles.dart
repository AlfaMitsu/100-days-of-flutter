import 'package:flutter/material.dart';
import 'colors.dart';

// TextStyle

TextStyle kHomeViewSubHeadingOuterTextStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  foreground: Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4
    ..color = kPurpleColor,
);

const TextStyle kHomeViewSubHeadingInnerTextStyle = TextStyle(
  fontSize: 40,
  color: kBlackTextColor,
  fontWeight: FontWeight.bold,
);

const TextStyle kCardNameTextStyle = TextStyle(
  height: 1,
  fontSize: 40,
  color: kBlackTextColor,
  fontWeight: FontWeight.w800,
);

const TextStyle kDashboardTitleTextStyle = TextStyle(
  fontSize: 35,
  color: kWhiteTextColor,
  fontWeight: FontWeight.w600,
);

const TextStyle kAppDetailsTextStyle = TextStyle(
  height: 1,
  fontSize: 18,
  color: kWhiteTextColor,
  fontWeight: FontWeight.w800,
);

const TextStyle kBitcoinTextStyle = TextStyle(
  fontSize: 18,
  color: kWhiteTextColor,
  fontWeight: FontWeight.w800,
);

const TextStyle kMasterCardTextStyle = TextStyle(
  fontSize: 18,
  color: kWhiteTextColor,
  fontWeight: FontWeight.w600,
);

const TextStyle kCartesianTextStyle = TextStyle(
  fontSize: 16,
  color: kWhiteTextColor,
  fontWeight: FontWeight.w900,
);

const TextStyle kBTCTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.white38,
  fontWeight: FontWeight.w800,
);
