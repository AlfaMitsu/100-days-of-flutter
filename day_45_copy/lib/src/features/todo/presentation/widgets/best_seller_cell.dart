import 'package:day_45_copy/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../constants/styles.dart';

class BestSellerCell extends StatelessWidget {
  final Map bObj;

  const BestSellerCell({
    super.key,
    required this.bObj,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: size.width * 0.32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(
                    0,
                    2,
                  ),
                  blurRadius: 5,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                bObj['img'].toString(),
                width: size.width * 0.32,
                height: size.width * 0.50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            bObj['name'].toString(),
            maxLines: 3,
            textAlign: TextAlign.left,
            style: kBestSellerTextStyle,
          ),
          const SizedBox(height: 8),
          Text(
            bObj['author'].toString(),
            maxLines: 1,
            textAlign: TextAlign.left,
            style: kAccountViewBooksTextStyle,
          ),
          const SizedBox(height: 8),
          IgnorePointer(
            ignoring: true,
            child: RatingBar.builder(
              initialRating: double.tryParse(bObj['rating'].toString()) ?? 1,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 15,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: kPrimary,
              ),
              onRatingUpdate: (rating) {},
            ),
          ),
        ],
      ),
    );
  }
}
