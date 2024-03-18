import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rive/rive.dart';

import '../../../../constants/colors.dart';

class CustomCachedAssetLoading extends StatefulWidget {
  const CustomCachedAssetLoading({super.key});

  @override
  State<CustomCachedAssetLoading> createState() =>
      _CustomCachedAssetLoadingState();
}

class _CustomCachedAssetLoadingState extends State<CustomCachedAssetLoading> {
  var _index = 0;
  var _ready = false;
  final _imageCache = [];
  final _fontCache = [];

  @override
  void initState() {
    super.initState();
    _warmUpCache();
  }

  Future<void> _warmUpCache() async {
    final futures = <Future>[];
    loadImage() async {
      final res = await http.get(
        Uri.parse('https://picsum.photos/500/500'),
      );
      final body = Uint8List.view(res.bodyBytes.buffer);
      final image = await ImageAsset.parseBytes(body);
      if (image != null) {
        _imageCache.add(image);
      }
    }

    loadFont(url) async {
      final res = await http.get(
        Uri.parse(url),
      );
      final body = Uint8List.view(res.bodyBytes.buffer);
      final font = await FontAsset.parseBytes(body);

      if (font != null) {
        _fontCache.add(font);
      }
    }

    for (var i = 0; i <= 10; i++) {
      futures.add(
        loadImage(),
      );
    }

    for (var url in [
      'https://cdn.rive.app/runtime/flutter/IndieFlower-Regular.ttf',
      'https://cdn.rive.app/runtime/flutter/comic-neue.ttf',
      'https://cdn.rive.app/runtime/flutter/inter.ttf',
      'https://cdn.rive.app/runtime/flutter/inter-tight.ttf',
      'https://cdn.rive.app/runtime/flutter/josefin-sans.ttf',
      'https://cdn.rive.app/runtime/flutter/send-flowers.ttf',
    ]) {
      futures.add(
        loadFont(url),
      );
    }

    await Future.wait(futures);

    setState(() => _ready = true);
  }

  void next() {
    setState(() => _index += 1);
  }

  void previous() {
    setState(() => _index -= 1);
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Warming up cache. Loading files from network...'),
              ),
              CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ],
          ),
        ),
      );
    }
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
                  ? _RiveRandomCachedImage(imageCache: _imageCache)
                  : _RiveRandomCachedFont(fontCache: _fontCache),
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

class _RiveRandomCachedImage extends StatefulWidget {
  const _RiveRandomCachedImage({
    required this.imageCache,
  });

  final List imageCache;

  @override
  State<_RiveRandomCachedImage> createState() => __RiveRandomCachedImageState();
}

class __RiveRandomCachedImageState extends State<_RiveRandomCachedImage> {
  List get _imageCache => widget.imageCache;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  RiveFile? _riveImageSampleFile;
  ImageAsset? _imageAsset;
  Future<void> _loadRiveFile() async {
    final imageFile = await RiveFile.asset(
      'lib/src/resources/assets/rive/image_out_of_band.riv',
      assetLoader: CallbackAssetLoader(
        (asset, bytes) async {
          if (asset is ImageAsset) {
            asset.image = _imageCache[Random().nextInt(_imageCache.length)];
            _imageAsset = asset;
            return true;
          }
          return false;
        },
      ),
    );

    setState(() => _riveImageSampleFile = imageFile);
  }

  @override
  Widget build(BuildContext context) {
    if (_riveImageSampleFile == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              RiveAnimation.direct(
                _riveImageSampleFile!,
                stateMachines: const ['State Machine 1'],
                fit: BoxFit.cover,
              ),
              const Positioned(
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    'This example caches images and swaps them out instantly.\n\nHover to zoom.',
                    style: TextStyle(color: kBlackColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              _imageAsset?.image =
                  _imageCache[Random().nextInt(_imageCache.length)];
            },
            child: const Text('Random image'),
          ),
        ),
      ],
    );
  }
}

class _RiveRandomCachedFont extends StatefulWidget {
  const _RiveRandomCachedFont({
    required this.fontCache,
  });

  final List fontCache;

  @override
  State<_RiveRandomCachedFont> createState() => __RiveRandomCachedFontState();
}

class __RiveRandomCachedFontState extends State<_RiveRandomCachedFont> {
  List get _fontCache => widget.fontCache;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  RiveFile? _riveFontSampleFile;
  final List<FontAsset?> _fontAssets = [];

  Future<void> _loadRiveFile() async {
    final fontFile = await RiveFile.asset(
      'lib/src/resources/assets/rive/acqua_text_out_of_band.riv',
      assetLoader: CallbackAssetLoader(
        (asset, bytes) async {
          if (asset is FontAsset) {
            asset.font = _fontCache[Random().nextInt(_fontCache.length)];
            _fontAssets.add(asset);
            return true;
          }
          return false;
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
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        Expanded(
          child: Stack(
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
                    'This example caches fonts and swaps them out instantly.\n\nClick to change drink.',
                    style: TextStyle(color: kBlackColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              for (var element in _fontAssets) {
                element?.font = _fontCache[Random().nextInt(_fontCache.length)];
              }
            },
            child: const Text('Random font'),
          ),
        ),
      ],
    );
  }
}
