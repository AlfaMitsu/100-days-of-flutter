import 'package:day_47/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/assets.dart';
import '../../../../../constants/styles.dart';
import '../../../data/data_sources/arrays.dart';
import '../../widgets/chat_date_bubble.dart';
import '../../widgets/chat_text_bubbles.dart';

class ChatConversationView extends StatefulWidget {
  final Map uObj;

  const ChatConversationView({
    super.key,
    required this.uObj,
  });

  @override
  State<ChatConversationView> createState() => _ChatConversationViewState();
}

class _ChatConversationViewState extends State<ChatConversationView> {
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: kWhiteColor,
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      widget.uObj['image'] as String? ?? '',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: kBase,
                    border: Border.all(
                      color: kWhiteColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Text(
              widget.uObj['name'] as String? ?? '',
              style: kChatConversationViewTextStyle,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(17.5),
              child: Image.asset(
                kImgInfoButton,
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: chatMessageArr.length,
        itemBuilder: (context, index) {
          var cObj = chatMessageArr[index] as Map? ?? {};
          if (cObj['is_text'] as bool? ?? false) {
            return ChatTextBubbles(
              cObj: cObj,
              uObj: (cObj['is_sender'] as bool? ?? false)
                  ? {
                      'image': kImgProfile,
                    }
                  : widget.uObj,
              isLeft: cObj['is_sender'] as bool? ?? false,
            );
          } else {
            return ChatDateBubble(
              date: cObj['message'] as String? ?? '',
            );
          }
        },
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
          color: Colors.transparent,
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
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  kImgPickerButton,
                  width: 30,
                  height: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  kImgAttachmentButton,
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
