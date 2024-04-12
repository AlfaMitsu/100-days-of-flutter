import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

int segmentedControlGroupValue = 0;

final Map<int, Widget> myTabs = <int, Widget>{
  0: Text(
    'All Games',
    style: kHomeViewMaterialSegmentedControlTextStyle,
  ),
  1: Text(
    'Live Games',
    style: kHomeViewMaterialSegmentedControlTextStyle,
  ),
  2: Text(
    'Finished',
    style: kHomeViewMaterialSegmentedControlTextStyle,
  ),
  3: Text(
    'Scheduled',
    style: kHomeViewMaterialSegmentedControlTextStyle,
  ),
  4: Text(
    'Pinned',
    style: kHomeViewMaterialSegmentedControlTextStyle,
  ),
};
