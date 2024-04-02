import 'package:day_47/src/constants/assets.dart';
import 'package:day_47/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';
import '../../data/data_sources/arrays.dart';
import '../widgets/user_row.dart';
import '../widgets/user_story_cell.dart';
import 'home/details_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
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
          'Search',
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
                    controller: txtSearch,
                    onChanged: (newVal) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Search by user name or full name',
                      hintStyle: kChatViewTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          if (txtSearch.text.isNotEmpty)
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 140 / 175,
                ),
                itemCount: storiesArr.length,
                itemBuilder: (context, index) {
                  var sObj = storiesArr[index] as Map? ?? {};
                  return UserStoryCell(
                    sObj: sObj,
                  );
                },
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 15,
                ),
                itemCount: searchArr.length,
                itemBuilder: (context, index) {
                  var uObj = searchArr[index] as Map? ?? {};
                  return UserRow(
                    uObj: uObj,
                  );
                },
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
