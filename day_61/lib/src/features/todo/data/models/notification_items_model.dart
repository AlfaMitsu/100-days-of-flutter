class NotificationItemsModel {
  final String title1, title2, person, time;

  NotificationItemsModel({
    required this.title1,
    required this.title2,
    required this.person,
    required this.time,
  });
}

List notificationItems = [
  NotificationItemsModel(
    person: "assets/images//person4.jpg",
    time: "04:20 pm",
    title1: "Mohammed Mohammed",
    title2: "+ profit on Football",
  ),
  NotificationItemsModel(
    person: "assets/images//person8.jpg",
    time: "04:45 pm",
    title1: "Ahmed El bassem",
    title2: "+ profit on Football",
  ),
  NotificationItemsModel(
    person: "assets/images/person3.jpg",
    time: "03:45 pm",
    title1: "Edward Noya",
    title2: "+ profit on Football",
  ),
];
