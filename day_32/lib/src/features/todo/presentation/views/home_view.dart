import 'package:dynamic_background/dynamic_background.dart';
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
      body: DynamicBg(
        duration: const Duration(seconds: 45),
        painterData: ScrollerPainterData(
          direction: ScrollDirection.left2Right,
          shape: ScrollerShape.circles,
          backgroundColor: ColorSchemes.gentlePurpleBg,
          color: ColorSchemes.gentlePurpleFg,
          shapeWidth: 24.0,
          spaceBetweenShapes: 24.0,
          fadeEdges: true,
          shapeOffset: ScrollerShapeOffset.shiftAndMesh,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 25),
              Expanded(
                child: Image.asset(
                  'lib/src/resources/assets/images/btn.png',
                ),
              ),
              const SizedBox(width: 25),
            ],
          ),
        ),
      ),
    );
  }
}
