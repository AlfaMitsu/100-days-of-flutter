import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../widgets/devices_cell_button.dart';
import '../widgets/round_icon_button.dart';
import 'detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectPage = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.sort,
            color: kUnselect,
            size: 25,
          ),
        ),
        backgroundColor: kTransparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 25,
              child: Image.asset(kImgProfile),
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
                'My Smart Home',
                style: kHomeViewTitleTextStyle,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: RoundIconButton(
                      name: 'Light',
                      icon: Icons.lightbulb,
                      bgColor: kColor1,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    child: RoundIconButton(
                      name: 'Media',
                      icon: Icons.smart_display,
                      bgColor: kColor2,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: RoundIconButton(
                      name: 'Camera',
                      icon: Icons.videocam,
                      bgColor: kColor3,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    child: RoundIconButton(
                      name: 'Wi-fi',
                      icon: Icons.wifi,
                      bgColor: kColor4,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Living Room',
                style: kHomeViewLivingRoomTextStyle,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text('2 devices', style: kHomeViewDevicesTextStyle),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                height: size.width * 0.5,
                child: Row(
                  children: [
                    Expanded(
                      child: DevicesCellButton(
                        name: 'Netgear\nWiFi Router',
                        img: kImgWifiRouter,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailView(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: DevicesCellButton(
                        name: 'Living Room\nSpeaker',
                        img: kImgRoomSpeaker,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(
                  () {
                    selectPage = 0;
                  },
                );
              },
              icon: Icon(
                Icons.home_filled,
                size: 30,
                color: selectPage == 0 ? kPrimary : kUnselect,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    selectPage = 1;
                  },
                );
              },
              icon: Icon(
                Icons.settings,
                size: 30,
                color: selectPage == 1 ? kPrimary : kUnselect,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.mic,
              color: kWhiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
