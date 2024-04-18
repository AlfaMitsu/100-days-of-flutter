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
    title: "All",
    image: "lib/src/resources/assets/images/all.png",
  ),
  Category(
    title: "Shoes",
    image: "lib/src/resources/assets/images/shoes.png",
  ),
  Category(
    title: "Beauty",
    image: "lib/src/resources/assets/images/beauty.png",
  ),
  Category(
    title: "Women's\nFashion",
    image: "lib/src/resources/assets/images/image1.png",
  ),
  Category(
    title: "Jewelry",
    image: "lib/src/resources/assets/images/jewelry.png",
  ),
  Category(
    title: "Men's\nFashion",
    image: "lib/src/resources/assets/images/men.png",
  ),
];
