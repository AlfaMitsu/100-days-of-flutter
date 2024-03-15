class CoffeeItem {
  double? rating;
  String? itemImg;
  String? title;
  String? subtitle;
  double? price;

  CoffeeItem({
    this.rating,
    this.itemImg,
    this.title,
    this.subtitle,
    this.price,
  });

  CoffeeItem.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    itemImg = json['itemImg'];
    title = json['title'];
    subtitle = json['subtitle'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['itemImg'] = itemImg;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['price'] = price;
    return data;
  }
}
