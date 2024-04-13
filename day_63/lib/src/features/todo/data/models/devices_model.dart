
import '../../../../constants/assets.dart';

class HomeDevicesModel {
  final String title, image, subTitel;

  HomeDevicesModel({
    required this.image,
    required this.title,
    required this.subTitel,
  });
}

List homeDevices = [
  HomeDevicesModel(
    image: kImgDevice1,
    title: 'Top Line 3',
    subTitel: 'Humidifier',
  ),
  HomeDevicesModel(
    image: kImgDevice2,
    title: 'Xiaomi',
    subTitel: 'Robot Vacuum Cleaner',
  ),
  HomeDevicesModel(
    image: kImgDevice3,
    title: 'Lightstar',
    subTitel: 'Desk Lamp',
  ),
  HomeDevicesModel(
    image: kImgDevice4,
    title: 'Alice',
    subTitel: 'Speaker Column',
  ),
  HomeDevicesModel(
    image: kImgDevice5,
    title: 'Brok V530',
    subTitel: 'Robot Vacuum Cleaner',
  ),
  HomeDevicesModel(
    image: kImgDevice6,
    title: 'Smart Bulb-2',
    subTitel: 'Smart Light Bulb',
  ),
  HomeDevicesModel(
    image: kImgDevice7,
    title: 'Goldair Kettle',
    subTitel: 'Wifi Kettle',
  ),
];
