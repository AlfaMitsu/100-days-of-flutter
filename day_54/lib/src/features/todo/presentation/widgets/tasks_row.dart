import 'package:flutter/material.dart';
import 'package:flutter_face_pile/flutter_face_pile.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class TaskRow extends StatelessWidget {
  final Map tObj;
  final int index;

  const TaskRow({
    super.key,
    required this.tObj,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var imgArr = tObj['image'] as List? ?? [];
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              tObj['dtime'].toString(),
              style: kTasksRowDTimeTextStyle,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: index % 2 == 0 ? kColor3 : kColor4,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tObj['name'].toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: index % 2 == 0 ? kColor3Text : kColor4Text,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    tObj['sub_name'].toString(),
                    style: TextStyle(
                      fontSize: 11,
                      color: index % 2 == 0 ? kColor3Text : kColor4Text,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 25 + ((imgArr.length - 1) * 25 * 0.6),
                        child: FacePile(
                          faces: imgArr.map(
                            (iObj) {
                              return FaceHolder(
                                id: iObj['id'].toString(),
                                name: iObj['name'].toString(),
                                avatar: NetworkImage(iObj['image'].toString()),
                              );
                            },
                          ).toList(),
                          faceSize: 25,
                          facePercentOverlap: .3,
                          borderColor: kWhiteColor,
                        ),
                      ),
                      Text(
                        tObj['time'].toString(),
                        style: TextStyle(
                          fontSize: 11,
                          color: index % 2 == 0 ? kColor3Text : kColor4Text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
