import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:day_47/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class GroupCell extends StatelessWidget {
  final Map gObj;
  final VoidCallback onPressed;

  const GroupCell({
    super.key,
    required this.gObj,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var imagesArr = gObj['image'] as List? ?? [];

    final settings = RestrictedPositions(
      maxCoverage: 0.3,
      minCoverage: 0.1,
      align: StackAlign.right,
      infoIndent: 4,
    );

    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 3,
        ),
        padding: const EdgeInsets.all(8),
        width: 150,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(
                0,
                2,
              ),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              height: 30,
              child: WidgetStack(
                positions: settings,
                stackedWidgets: imagesArr
                    .map(
                      (img) => Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: kWhiteColor, width: 2),
                          color: kWhiteColor,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            img as String? ?? '',
                            width: 30,
                            height: 30,
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
            const SizedBox(height: 8),
            Text(
              gObj['name'] as String? ?? '',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: kGroupCellTextStyle,
            ),
            const SizedBox(height: 4),
            Text(
              gObj['time"'] as String? ?? '',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: kGroupCellTimeTextStyle,
            ),
            const SizedBox(height: 4),
            const Divider(
              color: Colors.black12,
              indent: 8,
              endIndent: 8,
            ),
            const SizedBox(height: 4),
            Text(
              '${gObj['members'] as String? ?? ''} Members',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: kGroupCellTimeTextStyle,
            ),
            Text(
              '${gObj['comments'] as String? ?? ''} Comments',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: kGroupCellTimeTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
