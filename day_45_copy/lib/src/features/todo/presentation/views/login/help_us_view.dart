import 'package:day_45_copy/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';
import '../main_tab_view.dart';

class HelpUsView extends StatefulWidget {
  const HelpUsView({super.key});

  @override
  State<HelpUsView> createState() => _HelpUsViewState();
}

class _HelpUsViewState extends State<HelpUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help Up Help You',
                style: kHelpUsTextStyle,
              ),
              const SizedBox(height: 25),
              Text(
                'It seems as this is your first time using our app, please enter your location so we can filter our results and stock accordingly to your local store.',
                style: kLongTextTextStyle,
              ),
              const SizedBox(height: 20),
              Text(
                'If you choose to skip, you can change your location at any time in your account settings.',
                style: kLongTextTextStyle,
              ),
              const SizedBox(height: 15),
              const Text('Chanch Click'),
              const SizedBox(height: 15),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: kTextbox,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  hint: const Text('State'),
                  underline: Container(),
                  items: ['State1', 'State2'].map((name) {
                    return DropdownMenuItem(
                      value: name,
                      child: Text(name),
                    );
                  }).toList(),
                  onChanged: (selectVal) {},
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: kTextbox,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  hint: const Text('City'),
                  underline: Container(),
                  items: ['City1', 'City2'].map((name) {
                    return DropdownMenuItem(
                      value: name,
                      child: Text(name),
                    );
                  }).toList(),
                  onChanged: (selectVal) {},
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainTabView(),
                        ),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(color: kPrimary),
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
