import 'package:day_77/src/constants/assets.dart';

class UserDetail {
  String image;
  String name;
  bool currentMesage;
  String message;

  UserDetail({
    required this.image,
    required this.name,
    required this.message,
    required this.currentMesage,
  });
}

List<UserDetail> userItems = [
  UserDetail(
    image: kImgUser1,
    name: 'Monkey D. Luffy',
    message: 'Join my crew',
    currentMesage: true,
  ),
  UserDetail(
    image: kImgUser2,
    name: 'Roronoa Zoro',
    message: 'Want to train with me?',
    currentMesage: true,
  ),
  UserDetail(
    image: kImgUser3,
    name: 'Nami',
    message: 'Help me check some places',
    currentMesage: false,
  ),
  UserDetail(
    image: kImgUser4,
    name: 'Vinsmoke Sanji',
    message: 'I will teach you how to cook',
    currentMesage: false,
  ),
  UserDetail(
    image: kImgUser5,
    name: 'Trafalgar D. Water Law',
    message: 'I need you to help me operate',
    currentMesage: false,
  ),
  UserDetail(
    image: kImgUser6,
    name: 'Nico Robin',
    message: 'Lets decript the Poneglyph',
    currentMesage: false,
  ),
  UserDetail(
    image: kImgUser7,
    name: 'Boa Hancock',
    message: 'Is Luffy with you?',
    currentMesage: false,
  ),
  UserDetail(
    image: kImgUser8,
    name: 'Carrot',
    message: 'I love you',
    currentMesage: false,
  ),
  UserDetail(
    image: kImgUser9,
    name: 'Portgas D. Ace',
    message: 'Take care of Luffy for me',
    currentMesage: false,
  ),
  UserDetail(
    image: kImgUser10,
    name: 'Sabo',
    message: 'Take care of Luffy',
    currentMesage: false,
  ),
];
