import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class EventStarRating extends StatefulWidget {
  const EventStarRating({super.key});

  @override
  State<EventStarRating> createState() => _EventStarRatingState();
}

class _EventStarRatingState extends State<EventStarRating> {
  late StateMachineController _controller;

  @override
  void initState() {
    super.initState();
  }

  String ratingValue = 'Rating: 0';

  void onInit(Artboard artboard) async {
    _controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
    artboard.addController(_controller);

    _controller.addEventListener(onRiveEvent);
  }

  void onRiveEvent(RiveEvent event) {
    var rating = event.properties['rating'] as double;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        ratingValue = 'Rating: $rating';
      });
    });
  }

  @override
  void dispose() {
    _controller.removeEventListener(onRiveEvent);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: RiveAnimation.asset(
              'lib/src/resources/assets/rive/rating_animation.riv',
              onInit: onInit,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              ratingValue,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
