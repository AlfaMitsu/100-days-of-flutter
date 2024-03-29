import 'package:day_45_copy/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class RecentlyCell extends StatelessWidget {
  final Map iObj;
  const RecentlyCell({super.key, required this.iObj});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: size.width * 0.32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 2),
                  blurRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                iObj['img'].toString(),
                width: size.width * 0.32,
                height: size.width * 0.50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            iObj['name'].toString(),
            maxLines: 3,
            textAlign: TextAlign.left,
            style: kBestSellerTextStyle,
          ),
          Text(
            iObj['author'].toString(),
            maxLines: 1,
            textAlign: TextAlign.left,
            style: kAccountViewBooksTextStyle,
          ),
        ],
      ),
    );
  }
}
