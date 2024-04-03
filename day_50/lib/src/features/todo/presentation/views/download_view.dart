import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/arrays.dart';
import 'home/cast_details_view.dart';

class DownloadView extends StatefulWidget {
  const DownloadView({super.key});

  @override
  State<DownloadView> createState() => _DownloadViewState();
}

class _DownloadViewState extends State<DownloadView> {
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
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: downloadArr.length,
        itemBuilder: (context, index) {
          var dObj = downloadArr[index] as Map? ?? {};
          var image = dObj['image'].toString();
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
                  height: size.width * 0.22,
                  child: image != ''
                      ? ClipRect(
                          child: Image.asset(
                            image,
                            width: size.width * 0.35,
                            height: size.width * 0.22,
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
                        child: Text(
                          dObj['name'].toString(),
                          maxLines: 1,
                          style: kDownloadViewNameTextStyle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          (dObj['is_movie'] as bool? ?? false)
                              ? dObj['size'].toString()
                              : '${dObj['episodes'] ?? ''} Episodes | ${dObj['size'] ?? ''}',
                          style: kTvShowDetailsViewDurationTextStyle,
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
    );
  }
}
