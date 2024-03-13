import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/coffee_list.dart';
import '../../data/data_sources/coffee_types.dart';
import '../../data/models/coffee_item.dart';
import '../widgets/color_palette.dart';
import 'item_details_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  String selectedItem = 'Cappuccino';
  int counter = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette().scaffoldBg,
      bottomNavigationBar: _buildBottomBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 25, 15, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: kGreyColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Iconify(
                        HeroiconsSolid.view_grid,
                        size: 12,
                        color: kGrey800Color,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(kImgCoffeeShopLogo),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
                top: 15,
              ),
              width: (MediaQuery.of(context).size.width / 3) * 2 + 25.0,
              child: Text(
                'Coffee Shop UI',
                style: kCoffeeShopHeadingTextStyle,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SearchBar(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment(
                      0.7,
                      -1.0,
                    ),
                    end: Alignment(
                      1.0,
                      -1.0,
                    ),
                    colors: <Color>[
                      kBlackColor,
                      kTransparent,
                    ],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstATop,
                child: Container(
                  color: kCoffeeShopBrandColor,
                  width: MediaQuery.of(context).size.width - 20,
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...coffeeTypes.map(
                        (e) {
                          counter++;
                          if (counter <= 3) {
                            return _buildTypes(e, counter);
                          } else {
                            counter = 0;
                            return _buildTypes(e, counter);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                padding: const EdgeInsets.only(top: 5),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Container(
                      color: kCoffeeShopBrandColor,
                      width: MediaQuery.of(context).size.width - 10,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...coffeeList.map(
                            (e) {
                              return _buildCoffeeItem(e);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 10,
                    ),
                    child: Text(
                      'Special for you',
                      style: kCoffeeShopSubHeadingTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 125,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            ColorPalette().gradientTopLeft,
                            kBlackColor,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 115,
                            width: 125,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage(kCoffeeBeans),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 115,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width - 185,
                                  child: Text(
                                    '5 Coffee Beans You Must Try !',
                                    style: kCoffeeShopTitleTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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

  Widget _buildCoffeeItem(CoffeeItem cItem) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ItemDetailsView(cItem: cItem),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                ColorPalette().gradientTopLeft,
                kBlackColor,
              ],
            ),
          ),
          height: 200,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 140,
                width: 150,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Hero(
                        tag: cItem.itemImg.toString(),
                        child: Container(
                          height: 120,
                          width: 130,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(cItem.itemImg!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: kCoffeeShopBrandColor2.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.star,
                                color: ColorPalette().coffeeSelected,
                                size: 15,
                              ),
                              Text(
                                cItem.rating.toString(),
                                style: kCoffeeShopTitleTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  cItem.title!,
                  style: kCoffeeShopTitleTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 5,
                ),
                child: Text(
                  cItem.subtitle!,
                  style: kCoffeeShopSubTitleTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 60,
                      child: Row(
                        children: [
                          Text(
                            '\$',
                            style: kCoffeeShopPriceTextStyle,
                          ),
                          Text(
                            cItem.price.toString(),
                            style: kCoffeeShopTitleTextStyle,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: ColorPalette().coffeeSelected,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 10,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypes(coffee, counter) {
    return Padding(
      padding: counter != 0
          ? const EdgeInsets.only(left: 25)
          : const EdgeInsets.only(left: 7),
      child: Container(
        height: 50,
        color: kCoffeeShopBrandColor,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedItem = coffee;
                });
              },
              child: Text(
                coffee,
                style: GoogleFonts.sourceSans3(
                  fontWeight: FontWeight.bold,
                  color: coffee == selectedItem
                      ? ColorPalette().coffeeSelected
                      : ColorPalette().coffeeUnselected,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: coffee == selectedItem
                    ? ColorPalette().coffeeSelected
                    : kTransparent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      height: 50,
      decoration: const BoxDecoration(color: kCoffeeShopBrandColor3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Iconify(
            Ph.handbag_fill,
            color: kIconColor,
          ),
          const Iconify(
            Ri.heart_2_fill,
            color: kIconColor,
          ),
          const Iconify(
            Ph.user_bold,
            color: kIconColor,
          ),
          Stack(
            children: [
              const Iconify(
                HeroiconsSolid.bell,
                color: kIconColor,
              ),
              Positioned(
                top: 2,
                left: 15,
                child: Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.5),
                    color: kRedColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
