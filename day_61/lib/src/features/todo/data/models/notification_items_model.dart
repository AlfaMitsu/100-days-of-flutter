import 'package:day_61/src/constants/assets.dart';

class NotificationItemsModel {
  final String title1, title2, player, time;

  NotificationItemsModel({
    required this.title1,
    required this.title2,
    required this.player,
    required this.time,
  });
}

List notificationItems = [
  NotificationItemsModel(
    player: kImgPlayer4,
    time: '04:20 AM',
    title1: 'Usopp',
    title2: '+ Profit on Football',
  ),
  NotificationItemsModel(
    player: kImgPlayer8,
    time: '04:45 AM',
    title1: 'Trafalgar D. Water Law',
    title2: '+ Profit on Football',
  ),
  NotificationItemsModel(
    player: kImgPlayer3,
    time: '03:45 AM',
    title1: 'Vinsmoke Sanji',
    title2: '+ Profit on Football',
  ),
];
