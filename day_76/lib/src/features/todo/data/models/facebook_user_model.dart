import '../../../../constants/assets.dart';

class FacebookUser {
  String name;
  String image;
  String status;
  String profileImage;
  bool isOnline;
  String like;
  String comment;
  String storyImage;
  String time;

  FacebookUser({
    required this.name,
    required this.comment,
    required this.image,
    required this.isOnline,
    required this.like,
    required this.profileImage,
    required this.status,
    required this.storyImage,
    required this.time,
  });
}

List<FacebookUser> userInfo = [
  FacebookUser(
    name: 'Monkey D. Luffy',
    image: kImgPost1,
    status: "I'm going to become king of the pirates.",
    comment: '111',
    isOnline: true,
    like: '11K',
    time: '12 min ago',
    profileImage: kImgUser1,
    storyImage: kImgStory1,
  ),
  FacebookUser(
    name: 'Roronoa Zoro',
    image: kImgPost2,
    time: '2 h ago',
    status:
        'When I Decided to Follow My Dream, I Had Already Discarded My Life.',
    comment: '200',
    isOnline: true,
    like: '20.5K',
    profileImage: kImgUser2,
    storyImage: kImgStory2,
  ),
  FacebookUser(
    name: 'Nami',
    image: kImgPost3,
    time: '1 day ago',
    status:
        'Life is like a pencil that will surely run out, but will leave the beautiful writing of life.',
    comment: '2',
    isOnline: false,
    like: '20',
    profileImage: kImgUser3,
    storyImage: kImgStory3,
  ),
  FacebookUser(
    name: 'Vinsmoke Sanji',
    time: '22 hr ago',
    image: '',
    status:
        'Messing with a cook of the sea is a good way to get yourself killed.....Remember that well.',
    comment: '20',
    isOnline: true,
    like: '2K',
    profileImage: kImgUser4,
    storyImage: kImgStory4,
  ),
  FacebookUser(
    name: 'Trafalgar D. Water Law',
    time: '2 week ago',
    image: kImgPost5,
    status:
        "The big timers didn't take any action! It was like everyone was just preparing for something.",
    comment: '1k',
    isOnline: false,
    like: '100K',
    profileImage: kImgUser5,
    storyImage: kImgStory5,
  ),
];
