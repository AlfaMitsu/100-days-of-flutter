import 'package:flutter/material.dart';

import 'colors.dart';

// TextStyle

const TextStyle kXTextStyle = TextStyle(
  color: kBlueColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const TextStyle kAnimatedTyperTextStyle = TextStyle(
  color: kBlueColor,
  fontSize: 20,
  fontWeight: FontWeight.w600,
  shadows: [
    Shadow(
      color: kBlackColor,
      blurRadius: 20,
    ),
  ],
);

const TextStyle kAnimatedTypewritterTextStyle = TextStyle(
  color: kBlueColor,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

const TextStyle kBottomTitlesTextStyle = TextStyle(
  color: kPinkColor,
  fontSize: 14,
  fontWeight: FontWeight.bold,
);
