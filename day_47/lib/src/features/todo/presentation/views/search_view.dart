import 'package:flutter/material.dart';

import '../widgets/color_extension.dart';
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

  List searchArr = [
    {"name": "Emily Lerner", "image": "lib/src/resources/assets/images/u1.png", "tag": "@loveemily"},
    {
      "name": "Erin Anderson",
      "image": "lib/src/resources/assets/images/u2.png",
      "tag": "@erin4life"
    },
    {"name": "Ewan Coffey", "image": "lib/src/resources/assets/images/u3.png", "tag": "@ewancoffey"},
    {
      "name": "Elis Jimmy",
      "image": "lib/src/resources/assets/images/u4.png",
      "tag": "@its_me_jimmy"
    },
    {"name": "Elisha Gaines", "image": "lib/src/resources/assets/images/u1.png", "tag": "@elisha22"},
    {
      "name": "Eamon Shores",
      "image": "lib/src/resources/assets/images/u2.png",
      "tag": "@eamon_shores"
    },
    {"name": "Eileen Conners", "image": "lib/src/resources/assets/images/u3.png", "tag": "@eileen"},
    {
      "name": "Earl Garcia",
      "image": "lib/src/resources/assets/images/u4.png",
      "tag": "@earl-design"
    },
    {
      "name": "Elliemay Maio",
      "image": "lib/src/resources/assets/images/u1.png",
      "tag": "@elliemay_ny"
    },
    {"name": "Eathen Joy", "image": "lib/src/resources/assets/images/u2.png", "tag": "@eathen_12"},
    {
      "name": "Ebenezer Fidler",
      "image": "lib/src/resources/assets/images/u3.png",
      "tag": "@ebenezerfidler_"
    }
  ];

  List storiesArr = [
    {
      "name": "Megan Rae",
      "image": "lib/src/resources/assets/images/s1.png",
      "user_image": "lib/src/resources/assets/images/u1.png"
    },
    {
      "name": "Charles Dixon",
      "image": "lib/src/resources/assets/images/s2.png",
      "user_image": "lib/src/resources/assets/images/u2.png"
    },
    {
      "name": "Rebecca Taylor",
      "image": "lib/src/resources/assets/images/s3.png",
      "user_image": "lib/src/resources/assets/images/u3.png"
    },
    {
      "name": "Deanna Walser",
      "image": "lib/src/resources/assets/images/s4.png",
      "user_image": "lib/src/resources/assets/images/u4.png"
    },
    {
      "name": "Janice Williams",
      "image": "lib/src/resources/assets/images/s5.png",
      "user_image": "lib/src/resources/assets/images/u1.png"
    },
    {
      "name": "Adam Neumann",
      "image": "lib/src/resources/assets/images/s6.png",
      "user_image": "lib/src/resources/assets/images/u2.png"
    },
    {
      "name": "Mary Hennen",
      "image": "lib/src/resources/assets/images/s7.png",
      "user_image": "lib/src/resources/assets/images/u3.png"
    },
    {
      "name": "Joe Terpstra",
      "image": "lib/src/resources/assets/images/s8.png",
      "user_image": "lib/src/resources/assets/images/u4.png"
    },
    {
      "name": "William Yoshioka",
      "image": "lib/src/resources/assets/images/s9.png",
      "user_image": "lib/src/resources/assets/images/u1.png"
    },
    {
      "name": "Megan Rae",
      "image": "lib/src/resources/assets/images/s10.png",
      "user_image": "lib/src/resources/assets/images/u2.png"
    },
    {
      "name": "Charles Dixon",
      "image": "lib/src/resources/assets/images/s11.png",
      "user_image": "lib/src/resources/assets/images/u3.png"
    },
    {
      "name": "Rebecca Taylor",
      "image": "lib/src/resources/assets/images/s12.png",
      "user_image": "lib/src/resources/assets/images/u4.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "lib/src/resources/assets/images/back.png",
            width: 25,
            height: 25,
          ),
        ),
        centerTitle: false,
        title: Text(
          "Search",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
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
                "lib/src/resources/assets/images/user_profile.png",
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
          )
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
                  "lib/src/resources/assets/images/search.png",
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: txtSearch,
                    onChanged: (newVal) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search by user name or full name",
                      hintStyle: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
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
                      childAspectRatio: 140 / 175),
                  itemCount: storiesArr.length,
                  itemBuilder: (context, index) {
                    var sObj = storiesArr[index] as Map? ?? {};

                    return UserStoryCell(
                      sObj: sObj,
                    );
                  }),
            )
          else
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    itemCount: searchArr.length,
                    itemBuilder: (context, index) {
                      var uObj = searchArr[index] as Map? ?? {};
                      return UserRow(
                        uObj: uObj,
                      );
                    })),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
