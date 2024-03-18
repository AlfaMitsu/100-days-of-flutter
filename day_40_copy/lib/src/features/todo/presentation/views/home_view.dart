import 'package:flutter/material.dart';

import '../widgets/carousel.dart';
import '../widgets/custom_asset_loading.dart';
import '../widgets/custom_cached_asset_loading.dart';
import '../widgets/custom_controller.dart';
import '../widgets/event_sounds.dart';
import '../widgets/event_star_rating.dart';
import '../widgets/example_state_machine.dart';
import '../widgets/liquid_download.dart';
import '../widgets/little_machine.dart';
import '../widgets/play_one_shot_animation.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _pages = [
    const _Page(
      'Carousel',
      Carousel(),
    ),
    const _Page(
      'Asset Loading',
      CustomAssetLoading(),
    ),
    const _Page(
      'Cached Asset Loading',
      CustomCachedAssetLoading(),
    ),
    const _Page(
      'Custom Controller - Speed',
      CustomController(),
    ),
    const _Page(
      'Event Sounds',
      EventSounds(),
    ),
    const _Page(
      'Event Star Rating',
      EventStarRating(),
    ),
    const _Page(
      'Button State Machine',
      ExampleStateMachine(),
    ),
    const _Page(
      'Liquid Download',
      LiquidDownload(),
    ),
    const _Page(
      'Little Machine',
      LittleMachine(),
    ),
    const _Page(
      'Play One-Shot Animation',
      PlayOneShotAnimation(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => _NavButton(
            page: _pages[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: _pages.length,
        ),
      ),
    );
  }
}

class _Page {
  final String name;
  final Widget page;

  const _Page(
    this.name,
    this.page,
  );
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.page});

  final _Page page;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: SizedBox(
          width: 250,
          child: Center(
            child: Text(
              page.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => page.page,
            ),
          );
        },
      ),
    );
  }
}
