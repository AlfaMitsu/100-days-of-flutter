import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../data/models/product_model.dart';
import '../views/details_view.dart';
import 'rating.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int currentSelectItems = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return gamingItems(index);
        },
      ),
    );
  }

  GestureDetector gamingItems(int index) {
    double scale = 1.1;
    Color backgroundColor = kBackgroundColor;
    Color textColor = kPrimaryTextColor;
    if (currentSelectItems == index) {
      scale = 1.20;
      backgroundColor = kSelectCardBackgroundColor;

      textColor = kWhiteColor;
    }
    final game = productList[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsView(game: game),
          ),
        );
        if (currentSelectItems == index) {
        } else {
          setState(
            () {
              currentSelectItems = index;
            },
          );
        }
      },
      child: Row(
        children: [
          Container(
            width: 270 * scale,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              children: [
                Container(
                  width: 235 * scale,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kBlackColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 28,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 7 * scale),
                            Padding(
                              padding: const EdgeInsets.only(right: 90),
                              child: Text(
                                game.name,
                                maxLines: 2,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14 * scale,
                                  color: textColor,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            SizedBox(height: 7 * scale),
                            const Rating(),
                            SizedBox(height: 8 * scale),
                            Text(
                              '\$${game.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16 * scale,
                                color: textColor,
                              ),
                            ),
                            SizedBox(height: 8 * scale),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomRight: Radius.circular(21),
                            ),
                          ),
                          child: SvgPicture.asset(
                            kIcAddCart,
                            width: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: game.imagePic,
                      child: Image.asset(
                        game.imagePic,
                        height: 75 * scale,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
