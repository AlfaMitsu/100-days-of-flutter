import 'dart:core';

import '../../../../constants/assets.dart';

class Product {
  String name;
  String imagePic;
  double rating;
  int price;

  Product(this.name, this.price, this.imagePic, this.rating);
}

List<Product> productList = [
  Product(
    'Dualshock 4 Camouflage Red',
    60,
    kImgProduct2,
    4.0,
  ),
  Product(
    'Dualshock 4 Midnight Blue',
    55,
    kImgProduct3,
    4.0,
  ),
  Product(
    'Dualshock 4 Glacier White',
    50,
    kImgProduct1,
    4.0,
  ),
];
