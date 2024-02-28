import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> titles = [
    "SpinKitRotatingCircle",
    "SpinKitRotatingPlain",
    "SpinKitChasingDots",
    "SpinKitPumpingHeart",
    "SpinKitPulse",
    "SpinKitDoubleBounce",
    "SpinKitWave",
    "SpinKitWave",
    "SpinKitWave",
    "SpinKitPianoWave",
    "SpinKitPianoWave",
    "SpinKitPianoWave",
    "SpinKitThreeBounce",
    "SpinKitThreeInOut",
    "SpinKitWanderingCubes",
    "SpinKitWanderingCubes",
    "SpinKitCircle",
    "SpinKitFadingFour",
    "SpinKitFadingFour",
    "SpinKitFadingCube",
    "SpinKitCubeGrid",
    "SpinKitFoldingCube",
    "SpinKitRing",
    "SpinKitDualRing",
    "SpinKitSpinningLines",
    "SpinKitFadingGrid",
    "SpinKitFadingGrid",
    "SpinKitSquareCircle",
    "SpinKitSpinningCircle",
    "SpinKitSpinningCircle",
    "SpinKitFadingCircle",
    "SpinKitHourGlass",
    "SpinKitPouringHourGlass",
    "SpinKitPouringHourGlassRefined",
    "SpinKitRipple",
    "SpinKitDancingSquare",
  ];

  static const kits = <Widget>[
    SpinKitRotatingCircle(
      color: Color(0xFFC65115),
    ),
    SpinKitRotatingPlain(
      color: Color(0xFF00FF01),
    ),
    SpinKitChasingDots(
      color: Color(0xFF0000FF),
    ),
    SpinKitPumpingHeart(
      color: Color(0xFF403FBF),
    ),
    SpinKitPulse(
      color: Color(0xFF808080),
    ),
    SpinKitDoubleBounce(
      color: Color(0xFF000000),
    ),
    SpinKitWave(
      color: Color(0xFFF3ED32),
      type: SpinKitWaveType.start,
    ),
    SpinKitWave(
      color: Color(0xFFF3ED32),
      type: SpinKitWaveType.center,
    ),
    SpinKitWave(
      color: Color(0xFFF3ED32),
      type: SpinKitWaveType.end,
    ),
    SpinKitPianoWave(
      color: Color(0xFF78C419),
      type: SpinKitPianoWaveType.start,
    ),
    SpinKitPianoWave(
      color: Color(0xFF78C419),
      type: SpinKitPianoWaveType.center,
    ),
    SpinKitPianoWave(
      color: Color(0xFF78C419),
      type: SpinKitPianoWaveType.end,
    ),
    SpinKitThreeBounce(
      color: Color(0xFF45975E),
    ),
    SpinKitThreeInOut(
      color: Color(0xFF399AC0),
    ),
    SpinKitWanderingCubes(
      color: Color(0xFF1E6EB3),
    ),
    SpinKitWanderingCubes(
      color: Color(0xFF49449C),
      shape: BoxShape.circle,
    ),
    SpinKitCircle(
      color: Color(0xFF78338C),
    ),
    SpinKitFadingFour(
      color: Color(0xFFD9467A),
    ),
    SpinKitFadingFour(
      color: Color(0xFFE6475D),
      shape: BoxShape.rectangle,
    ),
    SpinKitFadingCube(
      color: Color(0xFFEC452E),
    ),
    SpinKitCubeGrid(
      size: 51.0,
      color: Color(0xFFF28531),
    ),
    SpinKitFoldingCube(
      color: Color(0xFFFBC833),
    ),
    SpinKitRing(
      color: Color(0xFF009CDE),
    ),
    SpinKitDualRing(
      color: Color(0xFF0D6FB4),
    ),
    SpinKitSpinningLines(
      color: Color(0xFF457205),
    ),
    SpinKitFadingGrid(
      color: Color(0xFFF5851E),
    ),
    SpinKitFadingGrid(
      color: Color(0xFFD21F18),
      shape: BoxShape.rectangle,
    ),
    SpinKitSquareCircle(
      color: Color(0xFF800080),
    ),
    SpinKitSpinningCircle(
      color: Color(0xFFCF6DC8),
    ),
    SpinKitSpinningCircle(
      color: Color(0xFF009BDD),
      shape: BoxShape.rectangle,
    ),
    SpinKitFadingCircle(
      color: Color(0xFFA4DEFF),
    ),
    SpinKitHourGlass(
      color: Color(0xFFFFDE59),
    ),
    SpinKitPouringHourGlass(
      color: Color(0xFF26D868),
    ),
    SpinKitPouringHourGlassRefined(
      color: Color(0xFFFF395D),
    ),
    SpinKitRipple(
      color: Color(0xFF275B53),
    ),
    SpinKitDancingSquare(
      color: Color(0xFF531553),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spinkit"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.adaptiveCrossAxisCount,
          mainAxisSpacing: 46,
          childAspectRatio: 1.2,
        ),
        padding: const EdgeInsets.only(top: 32, bottom: 64),
        itemCount: kits.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              kits[index],
              const SizedBox(
                height: 5,
              ),
              Text(
                titles[index],
                style: const TextStyle(fontSize: 12),
              ),
            ],
          );
        },
      ),
    );
  }
}

extension on BuildContext {
  int get adaptiveCrossAxisCount {
    final width = MediaQuery.of(this).size.width;
    if (width > 1024) {
      return 8;
    } else if (width > 720 && width < 1024) {
      return 6;
    } else if (width > 480) {
      return 4;
    } else if (width > 320) {
      return 3;
    }
    return 1;
  }
}
