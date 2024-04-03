import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/arrays.dart';
import '../widgets/detail_cell_button.dart';
import '../widgets/device_row.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: kUnselect,
            size: 25,
          ),
        ),
        backgroundColor: kTransparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: kUnselect,
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Netgear WiFi Router',
                style: kDetailViewTitleTextStyle,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Your network is online and everything\nlooks good',
                style: kDetailViewStatusTextStyle,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                height: 175,
                child: Row(
                  children: [
                    Expanded(
                      child: DetailCellButton(
                        bgColor: kColor5,
                        name: 'Download\nSpeed',
                        val: '69 Mbps',
                        icon: Icons.arrow_downward,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: DetailCellButton(
                        bgColor: kColor6,
                        name: 'Upload\nSpeed',
                        val: '12 Mbps',
                        icon: Icons.arrow_upward,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                '4 devices connected',
                style: kDetailViewDevicesConnectedTextStyle,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: listArr.map(
                  (lObj) {
                    return DeviceRow(lObj: lObj);
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
