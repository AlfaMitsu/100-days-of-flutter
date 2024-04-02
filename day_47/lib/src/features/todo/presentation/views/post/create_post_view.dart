import 'package:day_47/src/constants/assets.dart';
import 'package:day_47/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';
import '../../../data/data_sources/arrays.dart';
import '../home/details_view.dart';
import 'post_detail_view.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 1,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "What's on your mind?",
              style: kCreatePostViewTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  kImgLocationButton,
                  width: 10,
                  height: 10,
                ),
                const SizedBox(width: 8),
                Text(
                  'Davao, Philippines',
                  style: kDetailsViewBioTextStyle,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              itemCount: imageArr.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostDetailView(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imageArr[index] as String? ?? '',
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
