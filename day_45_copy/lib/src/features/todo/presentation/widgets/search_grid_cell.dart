import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class SearchGridCell extends StatelessWidget {
  final Map sObj;
  final int index;

  const SearchGridCell({
    super.key,
    required this.sObj,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: kSearchBGColor[index % kSearchBGColor.length],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 4,
      ),
      child: Column(
        children: [
          Text(
            sObj['name'].toString(),
            maxLines: 1,
            textAlign: TextAlign.center,
            style: kSearchGridCellTextStyle,
          ),
          const SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              sObj['img'].toString(),
              width: size.width * 0.23,
              height: size.width * 0.23 * 1.6,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
