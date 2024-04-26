import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            // _button('Play video from File'),
            _button(
              'Play video from Network',
              onPressed: () => Navigator.of(context).pushNamed('/fromNetwork'),
            ),
            _button(
              'Play video from Youtube',
              onPressed: () => Navigator.of(context).pushNamed('/fromYoutube'),
            ),
            _button(
              'Play video from Network quality urls',
              onPressed: () =>
                  Navigator.of(context).pushNamed('/fromNetworkQualityUrls'),
            ),
            _button(
              'Play video from Asset (with custom labels)',
              onPressed: () => Navigator.of(context).pushNamed('/fromAsset'),
            ),
            _button(
              'Play video from Vimeo',
              onPressed: () => Navigator.of(context).pushNamed('/fromVimeoId'),
            ),
            _button(
              'Play private video from Vimeo',
              onPressed: () =>
                  Navigator.of(context).pushNamed('/fromVimeoPrivateId'),
            ),
            _button(
              'Custom Video player',
              onPressed: () => Navigator.of(context).pushNamed('/customVideo'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(String text, {void Function()? onPressed}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: OutlinedButton(
          onPressed: onPressed ?? () {},
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
