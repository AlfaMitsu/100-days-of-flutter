import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/globe_coordinates.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';
import 'package:flutter_earth_globe/point.dart';
import 'package:flutter_earth_globe/point_connection.dart';
import 'package:flutter_earth_globe/point_connection_style.dart';
import 'package:flutter_earth_globe/sphere_style.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String? _selectedSurface;
  GlobeCoordinates? _hoverCoordinates;
  GlobeCoordinates? _clickCoordinates;
  late FlutterEarthGlobeController _controller;
  final List<String> _textures = [
    kImgEarthEvening,
    kImgEarthMorning,
    kImgJupiter,
    kImgMars,
    kImgMercury,
    kImgMoon,
    kImgNeptune,
    kImgSaturn,
    kImgStars,
    kImgSun,
    kImgUranus,
    kImgVenus,
  ];

  late List<Point> points;

  List<PointConnection> connections = [];

  Widget pointLabelBuilder(
      BuildContext context, Point point, bool isHovering, bool visible) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isHovering ? kPrimaryColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: kBox,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Text(
        point.label ?? '',
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: kWhiteColor),
      ),
    );
  }

  Widget connectionLabelBuilder(BuildContext context,
      PointConnection connection, bool isHovering, bool visible) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isHovering ? kPrimaryColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: kBox,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Text(
        connection.label ?? '',
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: kWhiteColor),
      ),
    );
  }

  @override
  initState() {
    _controller = FlutterEarthGlobeController(
        rotationSpeed: 0.05,
        zoom: 0.5,
        isRotating: false,
        isBackgroundFollowingSphereRotation: true,
        background: Image.asset(kImgStars).image,
        surface: Image.asset(kImgEarthMorning).image);
    points = [
      Point(
        id: '1',
        coordinates: const GlobeCoordinates(
          51.5072,
          0.1276,
        ),
        label: 'London',
        labelBuilder: pointLabelBuilder,
        style: const PointStyle(
          color: kRedColor,
          size: 6,
        ),
      ),
      Point(
        id: '2',
        labelBuilder: pointLabelBuilder,
        coordinates: const GlobeCoordinates(40.7128, -74.0060),
        style: const PointStyle(color: kLightGreenColor),
        onHover: () {},
        label: 'New York',
      ),
      Point(
        id: '3',
        labelBuilder: pointLabelBuilder,
        coordinates: const GlobeCoordinates(35.6895, 139.6917),
        style: const PointStyle(color: kBlueColor),
        onHover: () {},
        label: 'Tokyo',
      ),
      Point(
        id: '4',
        isLabelVisible: false,
        labelBuilder: pointLabelBuilder,
        onTap: () {
          Future.delayed(
            Duration.zero,
            () {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text('Center'),
                  content: Text('This is the center of the globe'),
                ),
              );
            },
          );
        },
        coordinates: const GlobeCoordinates(
          0,
          0,
        ),
        style: const PointStyle(color: kYellowColor),
        label: 'Center',
      ),
    ];
    connections = [
      PointConnection(
          id: '1',
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Text('London to New York'),
                content:
                    Text('This is a connection between London and New York'),
              ),
            );
          },
          start: points[0].coordinates,
          end: points[1].coordinates,
          isMoving: true,
          labelBuilder: connectionLabelBuilder,
          isLabelVisible: false,
          style: const PointConnectionStyle(
            type: PointConnectionType.dotted,
            color: kRedColor,
            lineWidth: 2,
            dashSize: 6,
            spacing: 10,
          ),
          label: 'London to New York'),
      PointConnection(
          start: points[1].coordinates,
          end: points[3].coordinates,
          isMoving: true,
          labelBuilder: connectionLabelBuilder,
          id: '2',
          style: const PointConnectionStyle(type: PointConnectionType.dashed),
          label: 'New York to Center'),
      PointConnection(
        label: 'Tokyo to Center',
        labelBuilder: connectionLabelBuilder,
        start: points[2].coordinates,
        end: points[3].coordinates,
        id: '3',
      ),
    ];
    _controller.onLoaded = () {
      setState(
        () {
          _selectedSurface = _textures[0];
        },
      );
    };

    for (var point in points) {
      _controller.addPoint(point);
    }

    super.initState();
  }

  Widget getDividerText(String text) => Card(
        child: SizedBox(
          width: 250,
          child: Row(
            children: [
              Flexible(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  color: kContainer,
                  height: 2,
                ),
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  color: kContainer,
                  height: 2,
                ),
              ),
            ],
          ),
        ),
      );

  getTextures() {
    return ListView(
      shrinkWrap: true,
      children: _textures
          .map(
            (texture) => Card(
              clipBehavior: Clip.hardEdge,
              color: _selectedSurface == texture
                  ? kCardPrimaryColor
                  : kCardSecondaryColor,
              child: InkWell(
                onTap: () {
                  _controller.loadSurface(Image.asset(
                    texture,
                  ).image);

                  if (texture.contains('sun') ||
                      texture.contains('venus') ||
                      texture.contains('mars')) {
                    _controller.setSphereStyle(
                      SphereStyle(
                        shadowColor: kSphereColor,
                        shadowBlurSigma: 20,
                      ),
                    );
                  } else {
                    _controller.setSphereStyle(const SphereStyle());
                  }
                  setState(
                    () {
                      _selectedSurface = texture;
                    },
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          texture,
                          width: 100,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      texture
                          .replaceFirst('lib/src/resources/assets/images/', '')
                          .split('.')[0]
                          .replaceAll('_', ' ')
                          .split(' ')[1]
                          .toUpperCase(),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget getListAction(String label, Widget child, {Widget? secondary}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label),
                const SizedBox(width: 10),
              ],
            ),
            secondary ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget leftSideContent() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: 220,
      child: ListView(
        shrinkWrap: true,
        children: [
          getListAction(
            'Rotate',
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: _controller.isRotating,
                  onChanged: (value) {
                    if (value) {
                      _controller.startRotation();
                    } else {
                      _controller.stopRotation();
                    }
                    setState(() {});
                  },
                ),
                IconButton(
                  onPressed: () {
                    _controller.resetRotation();
                  },
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          ),
          getListAction('Rotation speed', Container(),
              secondary: Slider(
                  value: _controller.rotationSpeed,
                  onChanged: _controller.isRotating
                      ? (value) {
                          _controller.rotationSpeed = value;
                          setState(() {});
                        }
                      : null)),
          getListAction(
            'Zoom',
            Container(),
            secondary: Slider(
              min: _controller.minZoom,
              max: _controller.maxZoom,
              value: _controller.zoom,
              divisions: 8,
              onChanged: (value) {
                _controller.setZoom(value);
                setState(() {});
              },
            ),
          ),
          getDividerText('Points'),
          ...points.map((e) => getListAction(
              e.label ?? '',
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: _controller.points
                        .where((element) => element.id == e.id)
                        .isNotEmpty,
                    onChanged: (value) {
                      if (value == true) {
                        _controller.addPoint(e);
                      } else {
                        _controller.removePoint(e.id);
                      }
                      setState(() {});
                    },
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      _controller.focusOnCoordinates(e.coordinates,
                          animate: true);
                    },
                    icon: const Icon(Icons.location_on),
                  ),
                ],
              ),
              secondary: _controller.points
                      .where((element) => element.id == e.id)
                      .isNotEmpty
                  ? Row(
                      children: [
                        Slider(
                          value: e.style.size / 30,
                          onChanged: (value) {
                            value = value * 30;
                            _controller.updatePoint(
                              e.id,
                              style: e.style.copyWith(size: value),
                            );
                            e.style = e.style.copyWith(size: value);
                            setState(() {});
                          },
                        ),
                      ],
                    )
                  : null)),
          getDividerText('Connections'),
          ...connections.map(
            (e) => getListAction(
              e.label ?? '',
              Checkbox(
                value: _controller.connections
                    .where((element) => element.id == e.id)
                    .isNotEmpty,
                onChanged: (value) {
                  if (value == true) {
                    _controller.addPointConnection(e, animateDraw: true);
                  } else {
                    _controller.removePointConnection(e.id);
                  }
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getLeftSide() {
    if (MediaQuery.of(context).size.width < 800) {
      return IconButton.filled(
        onPressed: () {
          _key.currentState?.openDrawer();
        },
        icon: const Icon(Icons.menu),
      );
    } else {
      return leftSideContent();
    }
  }

  Widget rightSideContent() {
    return SizedBox(
      width: 220,
      height: MediaQuery.of(context).size.height - 10,
      child: getTextures(),
    );
  }

  Widget getRightSide() {
    if (MediaQuery.of(context).size.width < 800) {
      return IconButton.filled(
        onPressed: () {
          _key.currentState?.openEndDrawer();
        },
        icon: const Icon(Icons.menu),
      );
    } else {
      return rightSideContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    double radius = MediaQuery.of(context).size.width < 500
        ? ((MediaQuery.of(context).size.width / 3.8) - 20)
        : 120;
    return Scaffold(
      key: _key,
      drawerEnableOpenDragGesture: true,
      endDrawerEnableOpenDragGesture: true,
      drawer: MediaQuery.of(context).size.width < 800
          ? Container(
              color: Colors.white38,
              child: leftSideContent(),
            )
          : null,
      endDrawer: MediaQuery.of(context).size.width < 800
          ? Container(
              color: Colors.white38,
              child: rightSideContent(),
            )
          : null,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            FlutterEarthGlobe(
              onZoomChanged: (zoom) {
                setState(() {});
              },
              onTap: (coordinates) {
                setState(() {
                  _clickCoordinates = coordinates;
                });
              },
              onHover: (coordinates) {
                if (coordinates == null) return;

                setState(() {
                  _hoverCoordinates = coordinates;
                });
              },
              controller: _controller,
              radius: radius,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue.withOpacity(0.5)),
              child: Text(
                'Flutter Earth Globe',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
            Positioned(top: 10, left: 10, child: getLeftSide()),
            Positioned(top: 10, right: 10, child: getRightSide()),
            Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Hover coordinates',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                  'Latitude: ${_hoverCoordinates?.latitude ?? 0}'),
                              Text(
                                  'Longitude: ${_hoverCoordinates?.longitude ?? 0}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Click coordinates',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                  'Latitude: ${_clickCoordinates?.latitude ?? 0}'),
                              Text(
                                  'Longitude: ${_clickCoordinates?.longitude ?? 0}'),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
