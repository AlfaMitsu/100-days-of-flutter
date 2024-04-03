import 'package:day_50/src/constants/assets.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/arrays.dart';
import '../widgets/round_text_field.dart';
import 'home/cast_details_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RoundTextField(
                title: '',
                controller: txtSearch,
                hintText: 'Search here...',
                left: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Image.asset(
                    kImgTabSearchButton,
                    width: 20,
                    height: 20,
                    color: kBgText,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: searchArr.length,
              itemBuilder: ((context, index) {
                var sObj = searchArr[index] as Map? ?? {};
                var sArr = sObj['list'] as List? ?? [];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                              sObj['name'].toString(),
                              style: kHomeViewMovieGenreTextStyle,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: kSubtext,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: (size.width * 0.4),
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: sArr.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CastDetailsView(),
                                  ),
                                );
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                color: kCastBG,
                                width: size.width * 0.25,
                                height: size.width * 0.32,
                                child: ClipRect(
                                  child: Image.asset(
                                    sArr[index].toString(),
                                    width: size.width * 0.25,
                                    height: size.width * 0.32,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
