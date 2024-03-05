import 'package:flutter/material.dart';

import 'clicked_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        trailing: const Hero(
          tag: 'tag-1',
          child: Icon(Icons.person),
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ClickedPage(),
          ),
        ),
        title: const Text('Click Here'),
      ),
    );
  }
}
