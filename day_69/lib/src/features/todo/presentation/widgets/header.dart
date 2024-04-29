import 'package:day_69/src/constants/assets.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import 'custom_search_bar.dart';
import 'profile_and_cart.dart';
import 'responsive_widget.dart';
import 'web/web_menu.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      width: double.infinity,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ResponsiveWidget(
                    mobile: Row(
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(Icons.menu),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          '  PET SHOP',
                          style: kPetShopTextStyle,
                        ),
                        const Spacer(),
                        const ProfileAndCart(),
                      ],
                    ),
                    desktop: const Row(
                      children: [
                        Expanded(
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage(
                              kImgLogo,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'PET SHOP',
                          style: kPetShopTextStyle,
                        ),
                        Spacer(),
                        Spacer(),
                        WebMenu(),
                        Spacer(),
                        ProfileAndCart(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const CustomSearchBar(),
                  const SizedBox(height: 50),
                  ResponsiveWidget(
                    mobile: Column(
                      children: [
                        const Text(
                          "Unitl one has loved an animal,\na part of one's soul\nremains unawakened.",
                          style: kDescription2TextStyle,
                        ),
                        const SizedBox(height: 20),
                        Image.asset(
                          kImgPets,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 20),
                        startShoppingButton(),
                      ],
                    ),
                    desktop: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Unitl one has loved an animal,\na part of one's soul\nremains unawakened.",
                                style: kDescription2TextStyle,
                              ),
                              const SizedBox(height: 20),
                              startShoppingButton(),
                            ],
                          ),
                          const Spacer(),
                          Expanded(
                            child: Image.asset(
                              kImgPets,
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

  Container startShoppingButton() {
    return Container(
      height: 50,
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: kBlueColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Center(
        child: Text(
          'Start Shopping',
          style: kStartShoppingTextStyle,
        ),
      ),
    );
  }
}
