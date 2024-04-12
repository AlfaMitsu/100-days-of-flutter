import '../../../../constants/assets.dart';

class SpainModel {
  final String title1, title2, image1, image2, player1, player2, score, gametime;
  int time;

  SpainModel({
    required this.title1,
    required this.title2,
    required this.image1,
    required this.image2,
    required this.player1,
    required this.player2,
    required this.score,
    required this.time,
    required this.gametime,
  });
}

List spain = [
  SpainModel(
    image1: kImgRealMadrid,
    image2: kImgBarcelona,
    player1: kImgPlayer5,
    player2: kImgPlayer6,
    title1: 'Real Madrid',
    title2: 'Barcelona',
    score: '7:0',
    time: 290,
    gametime: '3:00 AM',
  ),
  SpainModel(
    image1: kImgVillareal,
    image2: kImgAlaves,
    player1: kImgPlayer7,
    player2: kImgPlayer8,
    title1: 'Villarreal',
    title2: 'Alaves',
    score: '2:0',
    time: 230,
    gametime: '3:15 AM',
  ),
  SpainModel(
    image1: kImgAtleticoMadrid,
    image2: kImgSevilla,
    player1: kImgPlayer9,
    player2: kImgPlayer10,
    title1: 'Atletico Madrid',
    title2: 'Sevilla',
    score: '2:1',
    time: 200,
    gametime: '3:30 AM',
  ),
  SpainModel(
    image1: kImgRealSociedad,
    image2: kImgEibar,
    player1: kImgPlayer11,
    player2: kImgPlayer12,
    title1: 'Real Sociedad',
    title2: 'Eibar',
    score: '0:2',
    time: 100,
    gametime: '3:45 AM',
  ),
];
