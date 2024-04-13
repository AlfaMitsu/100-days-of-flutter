import '../../../../constants/assets.dart';

class HomeInteriorModel {
  final String title, image, humidifier, airPurrifier;
  final bool boolHumidifier, boolAirPurrifier;
  final double floorlamp, mainLight;

  HomeInteriorModel({
    required this.image,
    required this.title,
    required this.humidifier,
    required this.airPurrifier,
    required this.floorlamp,
    required this.mainLight,
    required this.boolHumidifier,
    required this.boolAirPurrifier,
  });
}

List homeInterior = [
  HomeInteriorModel(
    image: kImg4,
    title: 'Bedroom',
    humidifier: '87%',
    airPurrifier: '52%',
    boolHumidifier: true,
    boolAirPurrifier: false,
    mainLight: 60,
    floorlamp: 40,
  ),
  HomeInteriorModel(
    image: kImg1,
    title: "Children's",
    humidifier: '70%',
    airPurrifier: '52%',
    boolHumidifier: false,
    boolAirPurrifier: true,
    mainLight: 70,
    floorlamp: 50,
  ),
  HomeInteriorModel(
    image: kImg3,
    title: 'Kitchen',
    humidifier: '80%',
    airPurrifier: '45%',
    boolHumidifier: true,
    boolAirPurrifier: false,
    mainLight: 80,
    floorlamp: 40,
  ),
  HomeInteriorModel(
    image: kImg2,
    title: 'Bathroom',
    humidifier: '77%',
    airPurrifier: '66%',
    boolHumidifier: true,
    boolAirPurrifier: true,
    mainLight: 50,
    floorlamp: 70,
  ),
  HomeInteriorModel(
    image: kImg5,
    title: 'Living Room',
    humidifier: '65%',
    airPurrifier: '44%',
    boolHumidifier: true,
    boolAirPurrifier: false,
    mainLight: 66,
    floorlamp: 55,
  ),
];
