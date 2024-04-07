import 'package:day_60/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../localization/locales.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late FlutterLocalization _flutterLocalization;

  late String _currentLocale;
  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPurpleColor,
      appBar: AppBar(
        backgroundColor: kPurpleColor,
        title: Text(
          LocaleData.title.getString(context),
        ),
        actions: [
          DropdownButton(
            value: _currentLocale,
            items: const [
              DropdownMenuItem(
                value: "en",
                child: Text("English"),
              ),
              DropdownMenuItem(
                value: "de",
                child: Text("German"),
              ),
              DropdownMenuItem(
                value: "zh",
                child: Text("Chinese"),
              ),
            ],
            onChanged: (value) {
              _setLocale(value);
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 50,
        ),
        child: Text(
          context.formatString(LocaleData.body, ['Al-Fasheer']),
          style: const TextStyle(
            fontSize: 21,
          ),
        ),
      ),
    );
  }

  void _setLocale(String? value) {
    if (value == null) return;
    if (value == "en") {
      _flutterLocalization.translate("en");
    } else if (value == "de") {
      _flutterLocalization.translate("de");
    } else if (value == "zh") {
      _flutterLocalization.translate("zh");
    } else {
      return;
    }
    setState(() {
      _currentLocale = value;
    });
  }
}
