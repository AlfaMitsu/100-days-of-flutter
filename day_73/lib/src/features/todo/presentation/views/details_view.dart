import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/models/product_model.dart';
import '../widgets/image_size.dart';
import '../widgets/rating.dart';

class DetailsView extends StatelessWidget {
  final Product game;

  const DetailsView({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            detailImage(),
            const ImageSize(),
            itemsDetails(),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${game.price}',
                    style: kGamePriceTextStyle,
                  ),
                  Container(
                    height: 80,
                    width: 200,
                    padding: const EdgeInsets.symmetric(
                      vertical: 28,
                      horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: const Center(
                      child: Text(
                        'Add to Cart',
                        style: kAddToCartTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container itemsDetails() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            game.name,
            style: kGameNameTextStyle,
          ),
          const SizedBox(height: 10),
          const Rating(),
          Text(
            'Unleash your color with the arrival of four new stvles. Each wireless controller comes loaded with the same DUALSHOCK@4 features including touch paa, motion sensors and punt-in rechargedole batterv.',
            style: kDescriptionTextStyle,
          ),
        ],
      ),
    );
  }

  SizedBox detailImage() {
    return SizedBox(
      height: 280,
      child: Stack(
        children: [
          Container(
            height: 200,
            color: kSelectCardBackgroundColor,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Hero(
                tag: game.imagePic,
                child: Image.asset(
                  game.imagePic,
                  height: 220,
                  width: 330,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar myAppbar() {
    return AppBar(
      iconTheme: const IconThemeData(color: kWhiteColor),
      backgroundColor: kSelectCardBackgroundColor,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.favorite_border,
            color: kWhiteColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
