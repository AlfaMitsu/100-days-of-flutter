import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: kSecondaryColor, size: 16),
        Icon(Icons.star, color: kSecondaryColor, size: 16),
        Icon(Icons.star, color: kSecondaryColor, size: 16),
        Icon(Icons.star, color: kSecondaryColor, size: 16),
        const Icon(Icons.star, color: Colors.black54, size: 16),
      ],
    );
  }
}
