import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/dimensions.dart';
import '../../../../constants/styles.dart';
import 'container_chart_card.dart';

class ContainerCardEthereum extends StatelessWidget {
  const ContainerCardEthereum({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: defaultPadding / 2),
      height: 230,
      width: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(defaultBorderRadius),
        ),
        color: Color(0xFF383846),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(kImgEthereum),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ETHEREUM',
                        style: kBitcoinTextStyle,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(right: defaultBorderRadius / 3),
                            child: Text(
                              '50.23',
                              style: kBitcoinTextStyle,
                            ),
                          ),
                          Text(
                            'ETH',
                            style: kBTCTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const ContainerChartCard(),
        ],
      ),
    );
  }
}
