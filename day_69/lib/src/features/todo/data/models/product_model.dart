import '../../../../constants/assets.dart';

class Product {
  String image;
  String title;

  int rating;

  Product({
    required this.rating,
    required this.image,
    required this.title,
  });
}

List<Product> products = [
  Product(
    rating: 5,
    title: 'Dog',
    image: kImgDog,
  ),
  Product(
    rating: 4,
    title: 'Cat',
    image: kImgCat,
  ),
  Product(
    rating: 5,
    title: 'Bird',
    image: kImgBird,
  ),
  Product(
    rating: 4,
    title: 'Fish',
    image: kImgFish,
  ),
];
