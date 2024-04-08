import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:day_47/src/constants/assets.dart';
import 'package:day_47/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';
import '../../../data/data_sources/arrays.dart';
import '../../widgets/comment_row.dart';
import 'comment_view.dart';

class PostDetailView extends StatefulWidget {
  const PostDetailView({super.key});

  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    final settings = RestrictedPositions(
      maxCoverage: 0.3,
      minCoverage: 0.1,
      align: StackAlign.left,
      infoIndent: 4,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            kImgBackButton,
            width: 25,
            height: 25,
          ),
        ),
        centerTitle: false,
        title: Text(
          'Post',
          style: kDetailsViewTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(17.5),
              child: Image.asset(
                kImgProfile,
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              kImgPostDetail,
              width: size.width,
              fit: BoxFit.fitWidth,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.width * 0.9),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10,
                        offset: Offset(0, -15),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                kImgFavoriteButton,
                                width: 25,
                                height: 25,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CommentView(),
                                  ),
                                );
                              },
                              icon: Image.asset(
                                kImgChat,
                                width: 25,
                                height: 25,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                kImgMoreButton,
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 80,
                                height: 50,
                                child: WidgetStack(
                                  positions: settings,
                                  stackedWidgets: [
                                    kImgActive1,
                                    kImgActive1,
                                  ]
                                      .map(
                                        (img) => Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            border: Border.all(
                                              color: kWhiteColor,
                                              width: 2,
                                            ),
                                            color: kWhiteColor,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 2,
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: Image.asset(
                                              img as String? ?? '',
                                              width: 45,
                                              height: 45,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  buildInfoWidget: (surplus) {
                                    return Center(
                                      child: Text(
                                        '+$surplus',
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Liked by',
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      style: kCommentViewTextStyle,
                                    ),
                                    Text(
                                      'Earl Garcia, Nancy Maio',
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      style: kPostDetailViewTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Text.rich(
                          TextSpan(
                            text:
                                'Obsessed with my desk at work. All cleaned & organized after 5 years ',
                            style: kDetailsViewBioTextStyle,
                            children: [
                              TextSpan(
                                text: '#workdesk',
                                style: kDetailsViewBioTextStyle,
                              ),
                              TextSpan(
                                text: ' #worklife',
                                style: kDetailsViewBioTextStyle,
                              ),
                              TextSpan(
                                text: ' #agency',
                                style: kDetailsViewBioTextStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '22 hours ago',
                          style: kCommentViewTextStyle,
                        ),
                        const Divider(),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: commentArr.length,
                          itemBuilder: (context, index) {
                            var cObj = commentArr[index] as Map? ?? {};
                            return CommentRow(
                              cObj: cObj,
                            );
                          },
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
