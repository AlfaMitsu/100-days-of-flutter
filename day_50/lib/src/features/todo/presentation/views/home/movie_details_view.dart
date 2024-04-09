import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../constants/assets.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/styles.dart';
import '../../../data/data_sources/arrays.dart';
import '../../widgets/round_button.dart';
import '../main_tab_view.dart';
import 'cast_details_view.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    super.initState();
    FBroadcast.instance().register(
      'change_mode',
      (value, callback) {
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBg,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.width * 0.8,
                      child: ClipRect(
                        child: Image.asset(
                          kImgMovieDetailPicture,
                          width: size.width,
                          height: size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.width * 0.8,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            kBgDark,
                            kBgDark.withOpacity(0),
                            kBg.withOpacity(0),
                            kBg
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.width * 0.8,
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          kImgPlayButton,
                          width: 55,
                          height: 55,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dora and the lost city of gold',
                            style: kMovieDetailsViewMovieName,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Movie',
                                style: kHomeViewMovieGenreTextStyle,
                              ),
                              Text(
                                ' | ',
                                style: kHomeViewMovieGenreTextStyle,
                              ),
                              Text(
                                'Adventure',
                                style: kHomeViewMovieGenreTextStyle,
                              ),
                              Text(
                                ' | ',
                                style: kHomeViewMovieGenreTextStyle,
                              ),
                              Text(
                                'Comedy',
                                style: kHomeViewMovieGenreTextStyle,
                              ),
                              Text(
                                ' | ',
                                style: kHomeViewMovieGenreTextStyle,
                              ),
                              Text(
                                'Family',
                                style: kHomeViewMovieGenreTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  '4.0',
                  style: kHomeViewRatingTextStyle,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: RatingBar(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 18,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                    ratingWidget: RatingWidget(
                      full: Image.asset(kImgStarFill),
                      half: Image.asset(kImgStar),
                      empty: Image.asset(kImgStar),
                    ),
                    onRatingUpdate: (rating) {
                      if (kDebugMode) {
                        print(rating);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school. ',
                    style: kCastDetailsViewDescriptionTextStyle,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 150,
                  child: RoundButton(
                    title: 'WATCH NOW',
                    height: 40,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainTabView(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Cast',
                        style: kCastDetailsViewKnownForTextStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: (size.width * 0.34) + 40,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: castArr.length,
                    itemBuilder: (context, index) {
                      var cObj = castArr[index] as Map? ?? {};
                      var image = cObj['image'].toString();
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CastDetailsView(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              color: kCastBG,
                              width: size.width * 0.25,
                              height: size.width * 0.32,
                              child: image != ''
                                  ? ClipRect(
                                      child: Image.asset(
                                        image,
                                        width: size.width * 0.25,
                                        height: size.width * 0.32,
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              cObj['name'].toString(),
                              style: kCastDetailsViewNameTextStyle,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: kTransparent,
                  elevation: 0,
                  leadingWidth: 100,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            kImgBackButton,
                            width: 13,
                            height: 13,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'BACK',
                            style: kCastDetailsViewBackTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimary1,
        onPressed: () {
          kTModeDark = !kTModeDark;
          FBroadcast.instance().broadcast('change_mode');
          if (mounted) {
            setState(() {});
          }
        },
        child: Icon(
          kTModeDark ? Icons.light_mode : Icons.dark_mode,
          color: kText,
        ),
      ),
    );
  }
}
