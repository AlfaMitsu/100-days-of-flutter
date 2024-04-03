import 'package:flutter/material.dart';

var barData = [
  {"name": "Sun", "income": 10, "expense": 0},
  {"name": "Mon", "income": 5, "expense": 4},
  {"name": "Tue", "income": 4, "expense": 3},
  {"name": "Wed", "income": 7, "expense": 2},
  {"name": "Tur", "income": 2, "expense": 5},
  {"name": "Fri", "income": 0, "expense": 8},
  {"name": "Sat", "income": 6, "expense": 2}
];

List selectTypeList = [
  {"name": "Send", "tag": 0, "icon": Icons.arrow_upward_outlined},
  {"name": "Recived", "tag": 1, "icon": Icons.arrow_downward_outlined},
  {"name": "Transaction", "tag": 2, "icon": Icons.compare_arrows_outlined},
  {"name": "Categories", "tag": 3, "icon": Icons.apps}
];
