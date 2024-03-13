import 'package:day_30/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

import '../../../../constants/styles.dart';
import '../../data/models/coffee_item.dart';
import '../widgets/color_palette.dart';

class ItemDetailsView extends StatefulWidget {
  final CoffeeItem cItem;
  const ItemDetailsView({
    super.key,
    required this.cItem,
  });

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            color: kBlackColor,
          ),
          Hero(
            tag: widget.cItem.itemImg.toString(),
            child: Container(
              height: (screenHeight / 2) + 70,
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    widget.cItem.itemImg.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 10,
            child: Container(
              color: kTransparent,
              height: 50,
              width: screenWidth - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: kCoffeeShopBrandColor4,
                        border: Border.all(
                          color: kCoffeeShopBrandColor5,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: kIconColor,
                        size: 17,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: kCoffeeShopBrandColor4,
                        border: Border.all(
                          color: kCoffeeShopBrandColor5,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.favorite_rounded,
                        color: kIconColor,
                        size: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: (screenHeight / 2) - 30,
            child: GlassContainer(
              height: 150,
              width: screenWidth,
              blur: 4,
              border: const Border.fromBorderSide(BorderSide.none),
              borderRadius: BorderRadius.circular(30),
              color: kBlackColor.withOpacity(0.6),
              child: SizedBox(
                height: 140,
                width: screenWidth - 20,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 25),
                      height: 140,
                      width: (screenWidth - 20) / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.cItem.title!,
                            style: kCoffeeShopCoffeeItemTitleTextStyle,
                          ),
                          Text(
                            widget.cItem.subtitle!,
                            style: kCoffeeShopCoffeeItemSubTitleTextStyle,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: ColorPalette().coffeeSelected,
                                size: 22,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                widget.cItem.rating.toString(),
                                style: kCoffeeShopCoffeeItemSubTitleTextStyle,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '(6,986)',
                                style: kCoffeeShopNumberOfUserTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25),
                      height: 140,
                      width: (screenWidth - 20) / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kCoffeeShopBrandColor6,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 0),
                                    Text(
                                      'Coffee',
                                      style: kCoffeeShopCoffeeTypeTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kCoffeeShopBrandColor6,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Iconify(
                                      Ic.round_water_drop,
                                      color: ColorPalette().coffeeSelected,
                                      size: 21,
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Milk',
                                      style: kCoffeeShopCoffeeTypeTextStyle,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 35,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kCoffeeShopBrandColor6,
                                ),
                                child: Center(
                                  child: Text(
                                    'Medium Roasted',
                                    style: kCoffeeShopCoffeeTypeTextStyle,
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
              ),
            ),
          ),
          Positioned(
            top: screenHeight / 2 + 140,
            child: SizedBox(
              height: screenHeight / 2 - 140,
              width: screenWidth,
              child: ListView(
                padding: const EdgeInsets.only(left: 15),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: kCoffeeShopCoffeeItemDescriptionTextStyle,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 50,
                        width: screenWidth - 30,
                        child: Text(
                          'A cappuccino is a coffee-based drink made primarily from espresso and milk',
                          style: kCoffeeShopCoffeeItemSubTitleTextStyle,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Size',
                        style: kCoffeeShopCoffeeItemDescriptionTextStyle,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: screenWidth - 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSizeButton('S', 0),
                            _buildSizeButton('M', 1),
                            _buildSizeButton('L', 2)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: screenWidth - 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Price',
                                  style:
                                      kCoffeeShopCoffeeItemDescriptionTextStyle,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$ ',
                                      style: kCoffeeShopPriceTextStyle,
                                    ),
                                    Text(
                                      widget.cItem.price.toString(),
                                      style:
                                          kCoffeeShopCoffeeItemPriceTextStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: (screenWidth / 2) + 50,
                                decoration: BoxDecoration(
                                  color: ColorPalette().coffeeSelected,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Buy Now',
                                    style: kCoffeeShopTitleTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeButton(String title, int index) {
    return AnimatedContainer(
      duration: const Duration(seconds: 4),
      curve: Curves.easeIn,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color:
                index == selectedIndex ? kBlackColor : kCoffeeShopBrandColor9,
            borderRadius: BorderRadius.circular(10),
            border: index == selectedIndex
                ? Border.all(
                    color: ColorPalette().coffeeSelected,
                    style: BorderStyle.solid,
                    width: 1.0)
                : Border.all(
                    color: kBlackColor,
                    style: BorderStyle.solid,
                    width: 0.2,
                  ),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.sourceCodePro(
                  color: index == selectedIndex
                      ? ColorPalette().coffeeSelected
                      : kCoffeeShopBrandColor10,
                  fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
