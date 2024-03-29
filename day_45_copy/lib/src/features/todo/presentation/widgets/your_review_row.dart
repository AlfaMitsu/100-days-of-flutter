import 'package:day_45_copy/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../constants/styles.dart';

class YourReviewRow extends StatelessWidget {
  final Map sObj;

  const YourReviewRow({
    super.key,
    required this.sObj,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  sObj['description'].toString(),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: kSignUpTextStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  'Read more >',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: kSignUpTextStyle,
                ),
                const SizedBox(height: 8),
                IgnorePointer(
                  ignoring: true,
                  child: RatingBar.builder(
                    initialRating:
                        double.tryParse(sObj['rating'].toString()) ?? 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: kPrimary,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              sObj['img'].toString(),
              width: size.width * 0.15,
              height: size.width * 0.15 * 1.6,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
