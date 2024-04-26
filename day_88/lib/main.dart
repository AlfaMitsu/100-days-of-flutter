import 'package:flutter/material.dart';

import 'src/features/todo/presentation/views/custom_video_controllers.dart';
import 'src/features/todo/presentation/views/home_view.dart';
import 'src/features/todo/presentation/views/play_video_from_asset.dart';
import 'src/features/todo/presentation/views/play_video_from_network.dart';
import 'src/features/todo/presentation/views/play_video_from_network_quality_urls.dart';
import 'src/features/todo/presentation/views/play_video_from_vimeo_id.dart';
import 'src/features/todo/presentation/views/play_video_from_vimeo_private_id.dart';
import 'src/features/todo/presentation/views/play_video_from_youtube.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/fromVimeoId': (context) => const PlayVideoFromVimeoId(),
        '/fromVimeoPrivateId': (context) => const PlayVideoFromVimeoPrivateId(),
        '/fromYoutube': (context) => const PlayVideoFromYoutube(),
        '/fromAsset': (context) => const PlayVideoFromAsset(),
        '/fromNetwork': (context) => const PlayVideoFromNetwork(),
        '/fromNetworkQualityUrls': (context) =>
            const PlayVideoFromNetworkQualityUrls(),
        '/customVideo': (context) => const CustomVideoControllers(),
      },
      home: const HomeView(),
    );
  }
}
