import '../../../../constants/assets.dart';

class MainSideFavoriteClubModel {
  final String title, image;
  final int index;

  MainSideFavoriteClubModel({
    required this.title,
    required this.image,
    required this.index,
  });
}

List mainSideFavoriteClub = [
  MainSideFavoriteClubModel(
    image: kImgManchesterUnited,
    title: 'Manchester United',
    index: 9,
  ),
  MainSideFavoriteClubModel(
    image: kImgRealMadrid,
    title: 'Real Madrid',
    index: 10,
  ),
  MainSideFavoriteClubModel(
    image: kImgManchesterCity,
    title: 'Manchester City',
    index: 11,
  ),
  MainSideFavoriteClubModel(
    image: kImgJuventus,
    title: 'Juventus',
    index: 12,
  ),
  MainSideFavoriteClubModel(
    image: kImgAlNassr,
    title: 'Al Nassr',
    index: 13,
  ),
];
