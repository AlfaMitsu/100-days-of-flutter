import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:http/http.dart' as http;

import '../../../../constants/colors.dart';

class CustomAssetLoading extends StatefulWidget {
  const CustomAssetLoading({super.key});

  @override
  State<CustomAssetLoading> createState() => _CustomAssetLoadingState();
}

class _CustomAssetLoadingState extends State<CustomAssetLoading> {
  var _index = 0;
  void next() => setState(() {
        _index += 1;
      });

  void previous() => setState(() {
        _index -= 1;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            GestureDetector(
              onTap: previous,
              child: const Icon(Icons.arrow_back),
            ),
            Expanded(
              child: (_index % 2 == 0)
                  ? const _RiveRandomImage()
                  : const _RiveRandomFont(),
            ),
            GestureDetector(
              onTap: next,
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}

class _RiveRandomImage extends StatefulWidget {
  const _RiveRandomImage();

  @override
  State<_RiveRandomImage> createState() => _RiveRandomImageState();
}

class _RiveRandomImageState extends State<_RiveRandomImage> {
  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  RiveFile? _riveImageSampleFile;

  Future<void> _loadFiles() async {
    final imageFile = await RiveFile.asset(
      'lib/src/resources/assets/rive/image_out_of_band.riv',
      assetLoader: CallbackAssetLoader(
        (asset, bytes) async {
          if (asset is ImageAsset && bytes == null) {
            final res = await http.get(
              Uri.parse('https://picsum.photos/500/500'),
            );
            await asset.decode(
              Uint8List.view(res.bodyBytes.buffer),
            );
            return true;
          } else {
            return false;
          }
        },
      ),
    );

    setState(() {
      _riveImageSampleFile = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_riveImageSampleFile == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Stack(
      children: [
        RiveAnimation.direct(
          _riveImageSampleFile!,
          stateMachines: const ['State Machine 1'],
          fit: BoxFit.cover,
        ),
        const Positioned(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'This example loads a random image dynamically and asynchronously.\n\nHover to zoom.',
              style: TextStyle(color: kBlackColor),
            ),
          ),
        ),
      ],
    );
  }
}

class _RiveRandomFont extends StatefulWidget {
  const _RiveRandomFont();

  @override
  State<_RiveRandomFont> createState() => _RiveRandomFontState();
}

class _RiveRandomFontState extends State<_RiveRandomFont> {
  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  RiveFile? _riveFontSampleFile;

  Future<void> _loadFiles() async {
    final fontFile = await RiveFile.asset(
      'lib/src/resources/assets/rive/acqua_text_out_of_band.riv',
      assetLoader: CallbackAssetLoader(
        (asset, bytes) async {
          if (asset is FontAsset && bytes == null) {
            final urls = [
              'https://cdn.rive.app/runtime/flutter/IndieFlower-Regular.ttf',
              'https://cdn.rive.app/runtime/flutter/comic-neue.ttf',
              'https://cdn.rive.app/runtime/flutter/inter.ttf',
              'https://cdn.rive.app/runtime/flutter/inter-tight.ttf',
              'https://cdn.rive.app/runtime/flutter/josefin-sans.ttf',
              'https://cdn.rive.app/runtime/flutter/send-flowers.ttf',
            ];

            final res = await http.get(
              Uri.parse(
                urls[Random().nextInt(urls.length)],
              ),
            );
            await asset.decode(
              Uint8List.view(res.bodyBytes.buffer),
            );
            return true;
          } else {
            return false;
          }
        },
      ),
    );

    setState(() {
      _riveFontSampleFile = fontFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_riveFontSampleFile == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Stack(
      children: [
        RiveAnimation.direct(
          _riveFontSampleFile!,
          stateMachines: const ['State Machine 1'],
          fit: BoxFit.cover,
        ),
        const Positioned(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'This example loads a random font dynamically and asynchronously.\n\nClick to change drink.',
              style: TextStyle(color: kBlackColor),
            ),
          ),
        ),
      ],
    );
  }
}
