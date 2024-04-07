import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> locales = [
  MapLocale("en", LocaleData.en),
  MapLocale("de", LocaleData.de),
  MapLocale("zh", LocaleData.zh),
];

mixin LocaleData {
  static const String title = 'title';
  static const String body = 'body';

  static const Map<String, dynamic> en = {
    title: 'Localization',
    body: 'Welcome to this localized Flutter application %a'
  };

  static const Map<String, dynamic> de = {
    title: 'Lokalisierung',
    body: 'Willkommen bei dieser lokalisierten Flutter-Anwendung %a'
  };

  static const Map<String, dynamic> zh = {
    title: '本土化',
    body: '欢迎使用这个本地化的 Flutter 应用程序 %a'
  };
}
