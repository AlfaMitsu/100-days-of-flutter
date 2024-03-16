import 'package:day_36/src/constants/assets.dart';
import 'package:day_36/src/constants/colors.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List shopItems = const [
    [
      "Avocado",
      "4.00",
      kImgAvocado,
      kLightGreenColor,
    ],
    [
      "Banana",
      "2.50",
      kImgBanana,
      kYellowColor,
    ],
    [
      "Chicken",
      "12.80",
      kImgChicken,
      kBrownColor,
    ],
    [
      "Water",
      "1.00",
      kImgWater,
      kBlueColor,
    ],
  ];

  List cartItems = [];

  get getCartItems => cartItems;

  get getShopItems => shopItems;

  void addItemToCart(int index) {
    cartItems.add(shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
