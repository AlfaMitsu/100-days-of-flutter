import 'package:day_7/src/constants/assets.dart';
import 'package:day_7/src/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var dragGesturePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter RawMagnifier Widget'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onPanUpdate: (details) => setState(() {
                      dragGesturePosition = details.localPosition;
                    }),
                    child: Column(
                      children: [
                        const Text('Drag on the Picture!'),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          kImgSample,
                          height: 400,
                          width: 400,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: dragGesturePosition.dx,
                    top: dragGesturePosition.dy,
                    child: const RawMagnifier(
                      size: Size(150, 150),
                      magnificationScale: 3,
                      decoration: MagnifierDecoration(
                        opacity: 1,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: kPinkColor,
                            width: 2,
                          ),
                        ),
                      ),
                      focalPointOffset: Offset.zero,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
