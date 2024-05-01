import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/models/car_model.dart';
import '../widgets/car_items.dart';
import 'details_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Available Cars',
          style: kAvailableCarsTextStyle,
        ),
        actions: const [
          Icon(
            Icons.menu,
            color: kWhiteColor,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: carList.length,
        itemBuilder: (context, index) {
          final car = carList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsView(car: car),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 50,
                    ),
                    padding: const EdgeInsets.only(
                      left: 25,
                      bottom: 15,
                      right: 20,
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kCardColor,
                    ),
                    child: Column(
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
                              textColor: kBlackColor,
                            ),
                            CarItems(
                              name: 'Model No',
                              value: car.model,
                              textColor: kBlackColor,
                            ),
                            CarItems(
                              name: 'CO2',
                              value: car.co2,
                              textColor: kBlackColor,
                            ),
                            CarItems(
                              name: 'Fule Cons',
                              value: car.fuelCons,
                              textColor: kBlackColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 30,
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
          );
        },
      ),
    );
  }
}
