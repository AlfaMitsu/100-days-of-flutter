import 'package:day_61/src/constants/assets.dart';

class MainSideFavoriteLeagueModel {
  final String title, image;
  final int index;

  MainSideFavoriteLeagueModel({
    required this.title,
    required this.image,
    required this.index,
  });
}

List mainSideFavoriteLeague = [
  MainSideFavoriteLeagueModel(
      image: kImgPremierLeague,
      title: 'Premier League',
      index: 4,),
  MainSideFavoriteLeagueModel(
    image: kImgLaLiga,
    title: 'La Liga',
    index: 5,
  ),
  MainSideFavoriteLeagueModel(
    image: kImgSerieA,
    title: 'Serie A',
    index: 6,
  ),
];
