import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/models/product_model.dart';
import '../widgets/details/add_to_cart.dart';
import '../widgets/details/detail_image_slider.dart';
import '../widgets/details/details_app_bar.dart';
import '../widgets/details/details_description.dart';
import '../widgets/details/item_details.dart';

class DetailsView extends StatefulWidget {
  final Product product;

  const DetailsView({
    super.key,
    required this.product,
  });

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  int currentImage = 0;
  int currentColor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContentColor,
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailAppBar(product: widget.product),
              DetailImageSlider(
                image: widget.product.image,
                onChange: (index) {
                  setState(
                    () {
                      currentImage = index;
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => AnimatedContainer(
                    duration: const Duration(microseconds: 300),
                    width: currentImage == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentImage == index ? kBlackColor : kTransparent,
                      border: Border.all(
                        color: kBlackColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemsDetails(product: widget.product),
                    const SizedBox(height: 20),
                    const Text(
                      'Color',
                      style: kColorTextStyle,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: List.generate(
                        widget.product.colors.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                currentColor = index;
                              },
                            );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentColor == index
                                  ? kWhiteColor
                                  : widget.product.colors[index],
                              border: currentColor == index
                                  ? Border.all(
                                      color: widget.product.colors[index],
                                    )
                                  : null,
                            ),
                            padding: currentColor == index
                                ? const EdgeInsets.all(2)
                                : null,
                            margin: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: widget.product.colors[index],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Description(
                      description: widget.product.description,
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
}
