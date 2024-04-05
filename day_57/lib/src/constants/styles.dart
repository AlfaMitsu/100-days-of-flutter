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

TextStyle kCardNumberTextStyle = GoogleFonts.ubuntu(
  fontSize: 18,
  color: kBlackTextColor,
  fontWeight: FontWeight.w200,
);
