import 'package:day_36/src/constants/assets.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avocado", "4.00", kImgProfile, Colors.green],
    ["Banana", "2.50", kImgProfile, Colors.yellow],
    ["Chicken", "12.80", kImgProfile, Colors.brown],
    ["Water", "1.00", kImgProfile, Colors.blue],
  ];

  // list of cart items
  List cartItems = [];

  get getCartItems => cartItems;

  get getShopItems => shopItems;

  // add item to cart
  void addItemToCart(int index) {
    cartItems.add(shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}