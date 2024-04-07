class MainSideFavoriteLeagueModel {
  final String title, image;
  final int index;

  MainSideFavoriteLeagueModel({
    required this.title,
    required this.image,
    required this.index,
  });
}

List mainSideFavouriteLeague = [
  MainSideFavoriteLeagueModel(
      image: "assets/images/premier_league.png",
      title: "Premier League",
      index: 4),
  MainSideFavoriteLeagueModel(
    image: "assets/images/la_liga.png",
    title: "La Liga",
    index: 5,
  ),
  MainSideFavoriteLeagueModel(
    image: "assets/images/Italian_Serie_A.png",
    title: "Serie A",
    index: 6,
  ),
];
