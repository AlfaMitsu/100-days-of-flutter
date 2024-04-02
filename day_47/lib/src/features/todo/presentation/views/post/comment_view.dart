import 'package:day_47/src/constants/assets.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/styles.dart';
import '../../../data/data_sources/arrays.dart';
import '../../widgets/comment_row.dart';

class CommentView extends StatefulWidget {
  const CommentView({super.key});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            kImgBackButton,
            width: 25,
            height: 25,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Comments',
          style: kChatConversationViewTextStyle,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: commentArr.length,
                itemBuilder: (context, index) {
                  var cObj = commentArr[index] as Map? ?? {};
                  return CommentRow(
                    cObj: cObj,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 15,
        ),
        decoration: const BoxDecoration(
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(
                0,
                -2,
              ),
            ),
          ],
        ),
        child: BottomAppBar(
          color: kTransparent,
          elevation: 0,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  kImgEmoji,
                  width: 30,
                  height: 30,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: kPrimaryText.withOpacity(0.8),
                      width: 0.5,
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: 'Type a message....',
                      hintStyle: kChatConversationViewTypeAMessageTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
