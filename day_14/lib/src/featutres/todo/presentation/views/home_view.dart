import 'package:day_14/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = ValueNotifier<bool>(false);
  bool value = false;

  bool theme = false;

  @override
  void initState() {
    _controller.addListener(
      () {
        setState(
          () {
            if (_controller.value) {
              theme = true;
            } else {
              theme = false;
            }
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme ? kWhiteColor : kGrey200Color,
      appBar: AppBar(
        backgroundColor: value ? kTealColor : kPinkColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 2,
              child: Switch(
                value: value,
                onChanged: (onChanged) {
                  setState(() {
                    value = onChanged;
                  });
                },
                activeColor: kLightGreenColor,
                inactiveTrackColor: kRedColor,
                thumbColor:
                    MaterialStateProperty.all(value ? kWhiteColor : kGreyColor),
              ),
            ),
            const SizedBox(height: 30),
            AdvancedSwitch(
              controller: _controller,
              enabled: true,
              height: 35,
              width: 120,
              borderRadius: const BorderRadius.all(
                Radius.circular(120),
              ),
              inactiveColor: kGreyColor,
              inactiveChild: const Text('Dark'),
              activeChild: const Text('Light'),
              thumb: ValueListenableBuilder<bool>(
                valueListenable: _controller,
                builder: (context, value, child) {
                  return Icon(
                    _controller.value
                        ? Icons.settings_input_antenna
                        : Icons.travel_explore,
                        size: 15,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
