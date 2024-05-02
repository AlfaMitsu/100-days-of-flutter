import 'package:flutter/material.dart';

import '../widgets/bumble_bee_remote_video.dart';
import '../widgets/butter_fly_asset_video.dart';
import '../widgets/butter_fly_asset_video_in_list.dart';
import '../widgets/player_video_and_pop_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: const ValueKey<String>('home_page'),
        appBar: AppBar(
          title: const Text('Video Player Example'),
          actions: <Widget>[
            IconButton(
              key: const ValueKey<String>('push_tab'),
              icon: const Icon(Icons.navigation),
              onPressed: () {
                Navigator.push<PlayerVideoAndPopPage>(
                  context,
                  MaterialPageRoute<PlayerVideoAndPopPage>(
                    builder: (BuildContext context) => const PlayerVideoAndPopPage(),
                  ),
                );
              },
            )
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud),
                text: 'Remote',
              ),
              Tab(icon: Icon(Icons.insert_drive_file), text: 'Asset'),
              Tab(icon: Icon(Icons.list), text: 'List example'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            BumbleBeeRemoteVideo(),
            ButterFlyAssetVideo(),
            ButterFlyAssetVideoInList(),
          ],
        ),
      ),
    );
  }
}
