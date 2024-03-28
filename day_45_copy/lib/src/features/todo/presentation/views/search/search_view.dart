import 'package:day_45_copy/src/constants/colors.dart';
import 'package:day_45_copy/src/features/todo/presentation/widgets/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';
import '../../../data/data_sources/arrays.dart';
import '../../widgets/history_row.dart';
import '../../widgets/search_grid_cell.dart';
import 'search_filter_view.dart';
import 'search_force_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController textSearch = TextEditingController();
  int selectTag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0,
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
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchForceView(
                          didSearch: (sText) {
                            textSearch.text = sText;
                            if (mounted) {
                              setState(() {});
                            }
                          },
                        ),
                      ),
                    );
                    endEditing();
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
                    suffixIcon: SizedBox(
                      width: 40,
                      child: IconButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchFilterView(
                                didFilter: (fObj) {
                                  if (mounted) {
                                    setState(() {});
                                  }
                                },
                              ),
                            ),
                          );
                          endEditing();
                        },
                        icon: Icon(
                          Icons.tune,
                          color: kText,
                        ),
                      ),
                    ),
                    hintText: 'Search Books. Authors. or ISBN',
                    labelStyle: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            if (textSearch.text.isNotEmpty) const SizedBox(width: 8),
            if (textSearch.text.isNotEmpty)
              TextButton(
                onPressed: () {
                  textSearch.text = "";
                  setState(() {});
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
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 15,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: tagsArr.map((tagName) {
                  var index = tagsArr.indexOf(tagName);
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectTag = index;
                        });
                      },
                      child: Text(
                        tagName,
                        style: TextStyle(
                          color: selectTag == index ? kText : kSubTitle,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          if (textSearch.text.isEmpty)
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 15,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.75,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: searchArr.length,
                itemBuilder: (context, index) {
                  var sObj = searchArr[index] as Map? ?? {};
                  return SearchGridCell(
                    sObj: sObj,
                    index: index,
                  );
                },
              ),
            ),
          if (textSearch.text.isNotEmpty)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: sResultArr.length,
                itemBuilder: (context, index) {
                  var sObj = sResultArr[index] as Map? ?? {};
                  return HistoryRow(
                    sObj: sObj,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
