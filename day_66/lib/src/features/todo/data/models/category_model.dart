import '../../../../constants/assets.dart';

class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categoriesList = [
  Category(
    title: 'All',
    image: kImgAll,
  ),
  Category(
    title: 'Shoes',
    image: kImgShoes,
  ),
  Category(
    title: 'Beauty',
    image: kImgBeauty,
  ),
  Category(
    title: "Women's\nFashion",
    image: kImgSlider2,
  ),
  Category(
    title: 'Jewelry',
    image: kImgJewelry,
  ),
  Category(
    title: "Men's\nFashion",
    image: kImgMen,
  ),
];
