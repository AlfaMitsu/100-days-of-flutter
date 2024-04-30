import '../../../../constants/assets.dart';

class LeaderboardDetail {
  String image;
  String name;
  String rank;
  int point;

  LeaderboardDetail({
    required this.image,
    required this.name,
    required this.rank,
    required this.point,
  });
}

List<LeaderboardDetail> userItems = [
  LeaderboardDetail(
    image: kImgKokz,
    name: 'GeekFam.Kokz',
    rank: "4 ",
    point: 10018,
  ),
  LeaderboardDetail(
    image: kImgArmel,
    name: 'Aurora.Armel',
    rank: "5 ",
    point: 11172,
  ),
  LeaderboardDetail(
    image: kImgPalos,
    name: 'BLR.Palos',
    rank: "6 ",
    point: 10959,
  ),
  LeaderboardDetail(
    image: kImgTims,
    name: 'BLR.Tims',
    rank: "7 ",
    point: 10355,
  ),
  LeaderboardDetail(
    image: kImgYowe,
    name: 'Darleng.Yowe',
    rank: "8 ",
    point: 11230,
  ),
  LeaderboardDetail(
    image: kImgAbed,
    name: 'BLR.Abed',
    rank: "9 ",
    point: 9267,
  ),
];
