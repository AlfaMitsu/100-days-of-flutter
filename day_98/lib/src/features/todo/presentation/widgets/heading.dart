import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
  
  const Heading({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      height: 48.0,
      padding: const EdgeInsetsDirectional.only(start: 56.0),
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text,
        style: TextStyle(
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
