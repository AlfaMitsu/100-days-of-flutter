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
    image: kImgChampionsLeague,
    title: 'ChampionsLeague',
    index: 4,
  ),
  MainSideFavoriteLeagueModel(
    image: kImgPremierLeague,
    title: 'Premier League',
    index: 5,
  ),
  MainSideFavoriteLeagueModel(
    image: kImgBundesliga,
    title: 'Bundesliga',
    index: 6,
  ),
  MainSideFavoriteLeagueModel(
    image: kImgLaLiga,
    title: 'La Liga',
    index: 7,
  ),
  MainSideFavoriteLeagueModel(
    image: kImgSerieA,
    title: 'Serie A',
    index: 8,
  ),
];
