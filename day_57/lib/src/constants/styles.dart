import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

// TextStyle

TextStyle kHomeViewHeadingTextStyle = GoogleFonts.ubuntu(
  fontSize: 50,
  color: kWhiteTextColor,
  fontWeight: FontWeight.w800,
);

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

TextStyle kCurrencyTextStyle = GoogleFonts.ubuntu(
  fontSize: 30,
  color: kWhiteTextColor,
  fontWeight: FontWeight.w800,
);

TextStyle kActivityTextStyle = GoogleFonts.ubuntu(
  fontSize: 30,
  color: kWhiteTextColor,
  fontWeight: FontWeight.w600,
);

TextStyle kBalanceTextStyle = GoogleFonts.ubuntu(
  fontSize: 25,
  color: kWhiteTextColor,
  fontWeight: FontWeight.w600,
);

TextStyle kProfitTextStyle = GoogleFonts.ubuntu(
  fontSize: 22,
  color: Colors.greenAccent,
  fontWeight: FontWeight.w600,
);

TextStyle kGetStartedTextStyle = GoogleFonts.ubuntu(
  fontSize: 20,
  color: kWhiteTextColor,
  fontWeight: FontWeight.w600,
);

TextStyle kCardNumberTextStyle = GoogleFonts.ubuntu(
  fontSize: 18,
  color: kBlackTextColor,
  fontWeight: FontWeight.w200,
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

TextStyle kAllTextStyle = GoogleFonts.ubuntu(
  fontSize: 14,
  color: kWhiteTextColor,
  fontWeight: FontWeight.w600,
);