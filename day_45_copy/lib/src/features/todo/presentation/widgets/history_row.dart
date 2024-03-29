import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class HistoryRow extends StatelessWidget {
  final Map sObj;
  const HistoryRow({super.key, required this.sObj});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              sObj['img'].toString(),
              width: size.width * 0.25,
              height: size.width * 0.25 * 1.6,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  sObj['name'].toString(),
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: kHistoryRowTextStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  sObj['author'].toString(),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: kSearchFilterSortTextStyle,
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
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: kPrimary,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  sObj['description'].toString(),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: kSubTitle.withOpacity(0.3),
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: kButton),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: kPrimary,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kTransparent,
                            shadowColor: kTransparent,
                          ),
                          child: const Text(
                            'Add to cart',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kTransparent,
                              foregroundColor: kText,
                              shadowColor: kTransparent),
                          child: Text(
                            'Add to wishlist',
                            style: kHistoryRowWishlistTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
