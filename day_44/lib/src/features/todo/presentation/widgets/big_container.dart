import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class BigContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  const BigContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.25 / 2,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                kBlackColor.withOpacity(.6),
                kBlackColor.withOpacity(0),
              ],
              begin: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  color: kWhiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                price,
                style: const TextStyle(
                  color: Color.fromRGBO(255, 100, 150, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
