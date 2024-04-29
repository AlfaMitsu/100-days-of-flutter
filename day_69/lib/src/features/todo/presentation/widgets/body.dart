import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';
import '../../data/models/product_model.dart';
import 'pets_more_services.dart';
import 'popular_product.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const PetsMoreServices(),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Product',
                        textAlign: TextAlign.center,
                        style: kPopularProductTextStyle,
                      ),
                    ],
                  ),
                ),
                Wrap(
                  spacing: 20,
                  children: List.generate(
                    products.length,
                    (index) => PopularProduct(product: products[index]),
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
