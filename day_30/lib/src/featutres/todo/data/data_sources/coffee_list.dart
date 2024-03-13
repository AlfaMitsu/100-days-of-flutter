import '../../../../constants/assets.dart';
import '../models/coffee_item.dart';

final List<CoffeeItem> coffeeList = [
    CoffeeItem(
      rating: 4.5,
      itemImg: kImgCappucinoLatte,
      price: 4.21,
      subtitle: 'Latte',
      title: 'Cappuccino',
    ),
    CoffeeItem(
      rating: 4.2,
      itemImg: kImgCappucinoWithCinnamon,
      price: 3.14,
      subtitle: 'With Cinnamon',
      title: 'Cappuccino',
    ),
    CoffeeItem(
      rating: 4.6,
      itemImg: kImgCappucinoWithIce,
      price: 2.57,
      subtitle: 'With Ice',
      title: 'Cappuccino',
    ),
    CoffeeItem(
      rating: 4.4,
      itemImg: kImgCappucinoWithIceCream,
      price: 4.29,
      subtitle: 'With Ice Cream',
      title: 'Cappuccino',
    ),
  ];