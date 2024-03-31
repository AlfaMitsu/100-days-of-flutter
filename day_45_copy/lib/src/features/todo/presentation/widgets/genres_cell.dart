import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class GenresCell extends StatelessWidget {
  final Map bObj;
  final Color bgcolor;

  const GenresCell({
    super.key,
    required this.bObj,
    required this.bgcolor,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(15),
      ),
      width: size.width * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            bObj['img'].toString(),
            width: size.width * 0.7,
            height: size.width * 0.35,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 15),
          Text(
            bObj['name'].toString(),
            maxLines: 3,
            textAlign: TextAlign.center,
            style: kGenresCellTextStyle,
          ),
        ],
      ),
    );
  }
}
