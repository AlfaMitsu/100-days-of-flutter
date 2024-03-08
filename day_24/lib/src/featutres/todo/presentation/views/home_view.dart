import 'package:day_24/src/constants/colors.dart';
import 'package:day_24/src/constants/styles.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 8, minute: 30);

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then(
      (value) => setState(
        () {
          _timeOfDay = value!;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              _timeOfDay.format(context).toString(),
              style: const TextStyle(fontSize: 50),
            ),
            MaterialButton(
              onPressed: _showTimePicker,
              color: kBlueColor,
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Pick Time',
                  style: kPickTimeTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
