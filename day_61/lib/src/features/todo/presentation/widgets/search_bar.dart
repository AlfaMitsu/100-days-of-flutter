import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/dimensions.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(defaultBorderRadius),
        ),
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: kGrey200Color,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        style: const TextStyle(color: kGreyColor),
        decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: kBlackColor,
          ),
        ),
      ),
    );
  }
}
