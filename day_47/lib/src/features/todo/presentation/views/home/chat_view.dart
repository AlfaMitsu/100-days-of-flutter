import 'package:day_47/src/constants/assets.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/styles.dart';
import '../../../data/data_sources/arrays.dart';
import '../../widgets/group_cell.dart';
import '../../widgets/stories_cell.dart';
import '../../widgets/user_chat_row.dart';
import 'chat_conversation_view.dart';
import 'details_view.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
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
        centerTitle: false,
        title: Text(
          'Messages',
          style: kChatConversationViewTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsView(),
                ),
              );
            },
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset(
                    kImgSearchButton,
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Search Messages',
                        hintStyle: kChatViewTextStyle,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      kImgFilterButton,
                      width: 25,
                      height: 25,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: kWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    offset: Offset(
                      0,
                      2,
                    ),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Active',
                      style: kChatViewActiveTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      scrollDirection: Axis.horizontal,
                      itemCount: activeArr.length,
                      itemBuilder: (context, index) {
                        var rObj = activeArr[index] as Map? ?? {};
                        return StoriesCell(
                          rObj: rObj,
                          isActive: true,
                          onPressed: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My chats',
                    textAlign: TextAlign.start,
                    style: kChatViewMyChatsTextStyle,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      kImgEditButton,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: myChatArr.length,
              itemBuilder: (context, index) {
                var uObj = myChatArr[index] as Map? ?? {};
                return UserChatRow(
                  uObj: uObj,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatConversationView(uObj: uObj),
                      ),
                    );
                  },
                );
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              child: Text(
                'What people are talking about...',
                textAlign: TextAlign.start,
                style: kChatViewMyChatsTextStyle,
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: myGroupArr.length,
                itemBuilder: (context, index) {
                  var gObj = myGroupArr[index] as Map? ?? {};
                  return GroupCell(
                    gObj: gObj,
                    onPressed: () {},
                  );
                },
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
