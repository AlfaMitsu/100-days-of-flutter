import '../../../../constants/assets.dart';

class Car {
  String image;
  int price;
  String brand;
  String model;
  String co2;
  String fuelCons;

  Car(
    this.image,
    this.price,
    this.brand,
    this.model,
    this.co2,
    this.fuelCons,
  );
}

List<Car> carList = [
  Car(
    kImgBentley,
    120,
    'Bentley',
    '3A 9200',
    '77/km',
    '5,5 L',
  ),
  Car(
    kImgRollsRoyce,
    185,
    'RR',
    '3A 9200',
    '77/km',
    '5,5 L',
  ),
  Car(
    kImgMaserati,
    100,
    'Maserati',
    '3A 9200',
    '77/km',
    '5,5 L',
  ),
  Car(
    kImgCadillac,
    90,
    'Cadillac',
    '3A 9200',
    '77/km',
    '5,5 L',
  ),
];
