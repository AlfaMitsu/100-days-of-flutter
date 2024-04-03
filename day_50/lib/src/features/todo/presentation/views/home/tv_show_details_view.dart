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

class TvShowDetailsView extends StatefulWidget {
  const TvShowDetailsView({super.key});

  @override
  State<TvShowDetailsView> createState() => _TvShowDetailsViewState();
}

class _TvShowDetailsViewState extends State<TvShowDetailsView> {
  @override
  void initState() {
    super.initState();
    FBroadcast.instance().register('change_mode', (value, callback) {
      if (mounted) {
        setState(() {});
      }
    });
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
                          kImgTvShow,
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
                            'Narcos',
                            style: kMovieDetailsViewMovieName,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Drama',
                                style: kHomeViewMovieGenreTextStyle,
                              ),
                              Text(
                                ' | ',
                                style: kHomeViewMovieGenreTextStyle,
                              ),
                              Text(
                                'Biographical',
                                style: kHomeViewMovieGenreTextStyle,
                              ),
                              Text(
                                ' | ',
                                style: kHomeViewMovieGenreTextStyle,
                              ),
                              Text(
                                'Crime Film',
                                style: kHomeViewMovieGenreTextStyle,
                              ),
                              Text(
                                ' | ',
                                style: kHomeViewMovieGenreTextStyle,
                              ),
                              Text(
                                'Crime Fiction',
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
                  '9.0',
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
                    'Netflix chronicles the rise of the cocaine trade in Colombia and the gripping real-life stories of drug kingpins of the late ‘80s in this raw, gritty original series.',
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
                        'Episodes',
                        style: kCastDetailsViewKnownForTextStyle,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: epArr.length,
                  itemBuilder: (context, index) {
                    var cObj = epArr[index] as Map? ?? {};
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
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            color: kCastBG,
                            width: size.width * 0.35,
                            height: size.width * 0.25,
                            child: image != ''
                                ? ClipRect(
                                    child: Image.asset(
                                      image,
                                      width: size.width * 0.35,
                                      height: size.width * 0.25,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : null,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(cObj['name'].toString(),
                                      maxLines: 1,
                                      style: kCastDetailsViewKnownForTextStyle),
                                ),
                                const SizedBox(width: 8),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    cObj['duration'].toString(),
                                    style: kTvShowDetailsViewDurationTextStyle,
                                  ),
                                ),
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    kImgTabDownloadButton,
                                    width: 13,
                                    height: 13,
                                    color: kPrimary2,
                                  ),
                                  label: Text(
                                    'Download',
                                    style: kTvShowDetailsViewDownloadTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
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
                            color: kWhiteColor,
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
          FBroadcast.instance().broadcast("change_mode");
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
