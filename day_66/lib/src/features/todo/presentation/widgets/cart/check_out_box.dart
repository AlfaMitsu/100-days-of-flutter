import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/styles.dart';
import '../../../../core/cart_provider.dart';

class CheckOutBox extends StatelessWidget {
  const CheckOutBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              filled: true,
              fillColor: kContentColor,
              hintText: 'Enter Discount Code',
              hintStyle: kDiscountCodeTextStyle,
              suffixIcon: TextButton(
                onPressed: () {},
                child: const Text(
                  'Apply',
                  style: kApplyTextStyle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sub Total',
                style: kSubTotalTextStyle,
              ),
              Text(
                '\$${provider.totalPrice()}',
                style: kCategoryListTitleTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: kTotalTextStyle,
              ),
              Text(
                '\$${provider.totalPrice()}',
                style: kTotalTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              minimumSize: const Size(
                double.infinity,
                55,
              ),
            ),
            child: const Text(
              'Check out',
              style: kFollowTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
