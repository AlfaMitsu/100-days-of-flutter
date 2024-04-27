import 'email_model.dart';

class Item {
  const Item({
    required this.title,
    required this.emails,
  });

  final String title;
  final List<Email>? emails;
}
