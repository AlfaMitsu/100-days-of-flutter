import 'package:day_44/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../widgets/big_container.dart';
import '../widgets/small_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Discover',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'All are homemade items',
                            style: TextStyle(
                              color: kGreyColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.search,
                        size: 35,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const <Widget>[
                      SizedBox(width: 20),
                      BigContainer(
                        imagePath: kImgStrawberry,
                        price: '\$14.00',
                        title: 'Strawberry Ice Cream',
                      ),
                      BigContainer(
                        imagePath: kImgColorful,
                        price: '\$18.00',
                        title: 'Colorful Ice Cream',
                      ),
                      BigContainer(
                        imagePath: kImgOreo,
                        price: '\$12.00',
                        title: 'Oreo Ice Cream',
                      ),
                      BigContainer(
                        imagePath: kImgMatcha,
                        price: '\$24.00',
                        title: 'Green Ice Cream',
                      ),
                      BigContainer(
                        imagePath: kImgNormal,
                        price: '\$10.00',
                        title: 'Normal Ice Cream',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Recently added',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kTealColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          'Most Popular',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    children: const <Widget>[
                      SmallContainer(
                        imageLink: kImgStrawberry2,
                        title: 'Strawberry',
                        subTitle: 'Flavour',
                      ),
                      SmallContainer(
                        imageLink: kImgChocolate,
                        title: 'Chocolate',
                        subTitle: 'Flavour',
                      ),
                      SmallContainer(
                        imageLink: kImgOreo2,
                        title: 'Oreo',
                        subTitle: 'Flavour',
                      ),
                      SmallContainer(
                        imageLink: kImgWhite,
                        title: 'White',
                        subTitle: 'Creamy',
                      ),
                      SmallContainer(
                        imageLink: kImgUbe,
                        title: 'Ube',
                        subTitle: 'Flavour',
                      ),
                      SmallContainer(
                        imageLink: kImgRaspberry,
                        title: 'Raspberry',
                        subTitle: 'Flavour',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
