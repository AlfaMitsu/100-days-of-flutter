import 'package:day_50/src/constants/assets.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/styles.dart';
import '../../../data/data_sources/arrays.dart';

class CastDetailsView extends StatefulWidget {
  const CastDetailsView({super.key});

  @override
  State<CastDetailsView> createState() => _CastDetailsViewState();
}

class _CastDetailsViewState extends State<CastDetailsView> {
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
                      height: size.width * 1.1,
                      child: ClipRect(
                        child: Image.asset(
                          kTModeDark ? kImgActorDark : kImgActorLight,
                          width: size.width,
                          height: size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.width * 1.1,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Michael',
                            style: kCarDetailsViewFirstNameTextStyle,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Peña',
                            style: kCarDetailsViewSurnameTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Michael Peña was born and raised in Chicago, to Nicolasa, a social worker, and Eleuterio Peña, who worked at a button factory. His parents were originally from Mexico.',
                    style: kCarDetailsViewDescriptionTextStyle,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Known for',
                        style: kCarDetailsViewKnownForTextStyle,
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
                    itemCount: moviesArr.length,
                    itemBuilder: (context, index) {
                      var cObj = moviesArr[index] as Map? ?? {};
                      var image = cObj['image'].toString();
                      return Column(
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
                            style: kCarDetailsViewNameTextStyle,
                          ),
                        ],
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
                            color: kWhiteColor,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'BACK',
                            style: kCarDetailsViewBackTextStyle,
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
