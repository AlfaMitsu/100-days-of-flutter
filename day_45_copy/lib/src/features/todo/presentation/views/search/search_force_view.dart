import 'package:day_45_copy/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';
import '../../../data/data_sources/arrays.dart';

class SearchForceView extends StatefulWidget {
  final Function(String)? didSearch;
  const SearchForceView({super.key, this.didSearch});

  @override
  State<SearchForceView> createState() => _SearchForceViewState();
}

class _SearchForceViewState extends State<SearchForceView> {
  TextEditingController textSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0,
        leading: Container(),
        leadingWidth: 0,
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: kTextbox,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: textSearch,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 8,
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: kText,
                    ),
                    hintText: 'Search here',
                    labelStyle: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: kSearchFilterCancelTextStyle,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (textSearch.text.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              child: Text(
                'Previous Searches',
                style: kSearchForceViewTextStyle,
              ),
            ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 15,
              ),
              itemCount: textSearch.text.isEmpty
                  ? perviousArr.length
                  : resultArr.length,
              itemBuilder: (context, index) {
                var searchResultText = (textSearch.text.isEmpty
                        ? perviousArr
                        : resultArr)[index] as String? ??
                    "";
                return GestureDetector(
                  onTap: () {
                    if (widget.didSearch != null) {
                      widget.didSearch!(searchResultText);
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: kSubTitle,
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: Text(
                            searchResultText,
                            style: kSearchFilterItemNameTextStyle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'times',
                          style: kSearchForceViewTimesTextStyle,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
