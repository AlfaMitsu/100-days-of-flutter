import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../../core/favorite_provider.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;
    return Scaffold(
      backgroundColor: kContentColor,
      appBar: AppBar(
          backgroundColor: kContentColor,
          title: const Text(
            'Favorite',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index) {
                final favoritItems = finalList[index];
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                color: kContentColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                favoritItems.image,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favoritItems.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  favoritItems.category,
                                  style: kCartItemsCategoryTextStyle,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "\$${favoritItems.price}",
                                  style: kFavoriteItemsPriceTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              finalList.removeAt(index);
                              setState(
                                () {},
                              );
                            },
                            child: const Icon(
                              Icons.delete,
                              color: kRedColor,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
