import 'package:day_44/src/constants/colors.dart';
import 'package:flutter/material.dart';

class SmallContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageLink;
  const SmallContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imageLink),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              kBlackColor.withOpacity(.8),
              kBlackColor.withOpacity(0),
            ],
            begin: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: kWhiteColor,
              ),
            ),
            Text(
              subTitle,
              style: const TextStyle(
                color: kWhiteColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
