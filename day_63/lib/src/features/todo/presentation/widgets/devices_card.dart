import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/dimensions.dart';
import '../../data/models/devices_model.dart';

class DevicesCard extends StatelessWidget {
  final HomeDevicesModel homeDevices;

  const DevicesCard({
    super.key,
    required this.homeDevices,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding * 3),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(defaultBorderRadius * 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              homeDevices.image,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
