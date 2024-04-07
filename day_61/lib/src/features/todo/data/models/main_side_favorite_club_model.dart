class MainSideFavoriteClubModel {
  final String title, image;
  final int index;

  MainSideFavoriteClubModel({
    required this.title,
    required this.image,
    required this.index,
  });
}

List dmainSideFavouriteClub = [
  MainSideFavoriteClubModel(
    image: "assets/images/chelsea.png",
    title: "Chelsea F.C",
    index: 7,
  ),
  MainSideFavoriteClubModel(
    image: "assets/images/real_madrid.png",
    title: "Real Madrid",
    index: 8,
  ),
];
