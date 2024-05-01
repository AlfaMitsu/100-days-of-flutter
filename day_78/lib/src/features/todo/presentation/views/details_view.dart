import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/models/car_model.dart';
import '../widgets/car_items.dart';

class DetailsView extends StatelessWidget {
  final Car car;

  const DetailsView({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            kImgMap,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          carDetailAppbar(context),
          Positioned(
            left: 10,
            right: 10,
            bottom: 25,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 45),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      cardInformation(),
                      const Divider(
                        height: 15,
                        color: Colors.white70,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            kImgDriver,
                            height: 150,
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Jinbe',
                                          style: kNameTextStyle,
                                        ),
                                        Text(
                                          'LIcense: NWR 369852',
                                          style: kLicenseTextStyle,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '369',
                                          style: kNumberTextStyle,
                                        ),
                                        Text(
                                          "Ride",
                                          style: kRideTextStyle,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                const Row(
                                  children: [
                                    Text('5.0', style: kRatingTextStyle),
                                    SizedBox(width: 6),
                                    Icon(
                                      Icons.star,
                                      color: kWhiteColor,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: kWhiteColor,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: kWhiteColor,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: kWhiteColor,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: kWhiteColor,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: kCardColor,
                                      ),
                                      child: const Text(
                                        'Call',
                                        style: kPriceTextStyle,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: kCardColor,
                                      ),
                                      child: const Text(
                                        'Book Now',
                                        style: kPriceTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 60,
                  child: Hero(
                    tag: car.image,
                    child: Image.asset(
                      car.image,
                      height: 115,
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

  Column cardInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\$${car.price.toString()}',
          style: kAvailableCarsTextStyle,
        ),
        const Text(
          'price/hr',
          style: kPriceTextStyle,
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CarItems(
              name: 'Brand',
              value: car.brand,
              textColor: kBlackTextColor,
            ),
            CarItems(
              name: 'Model No',
              value: car.model,
              textColor: kBlackTextColor,
            ),
            CarItems(
              name: 'CO2',
              value: car.co2,
              textColor: kBlackTextColor,
            ),
            CarItems(
              name: 'Fule Cons',
              value: car.fuelCons,
              textColor: kBlackTextColor,
            ),
          ],
        ),
      ],
    );
  }

  SafeArea carDetailAppbar(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kWhiteColor,
            ),
          ),
          const Text(
            'Car Detail',
            style: kAvailableCarsTextStyle,
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.menu,
              color: kWhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
