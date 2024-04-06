import 'package:day_57/src/constants/colors.dart';
import 'package:day_57/src/constants/dimensions.dart';
import 'package:day_57/src/features/todo/presentation/widgets/container_card_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/styles.dart';
import '../widgets/chart_spline.dart';
import '../widgets/container_card_bitcoin.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: defaultPadding * 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(kImgLogo),
                    ),
                    Column(
                      children: [
                        const Text(
                          'Dashboard',
                          style: kDashboardTitleTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                          width: 150,
                          child: Image.asset(kImgShape2),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          child: Image.asset(kImgShape1),
                        ),
                        const Icon(
                          Icons.settings_outlined,
                          size: 40,
                          color: kWhiteColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding),
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding * 2),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          'Current',
                          style: kGetStartedTextStyle,
                          colors: const [
                            Color(0xFFA9E7A1),
                            Color(0xFFFDD19A),
                          ],
                        ),
                        GradientText(
                          'Balance',
                          style: kBalanceTextStyle,
                          colors: const [
                            Color(0xFFA9E7A1),
                            Color(0xFFFDD19A),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 10,
                      ),
                      child: Text(
                        '\$',
                        style: kCurrencyTextStyle,
                      ),
                    ),
                    Text(
                      '26,000',
                      style: kHomeViewHeadingTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 300,
                child: ChartSpline(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: defaultPadding * 2,
                  top: defaultPadding * 2,
                  bottom: defaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      'Recent',
                      style: kBalanceTextStyle,
                      colors: const [
                        Color(0xFFA9E7A1),
                        Color(0xFFFDD19A),
                      ],
                    ),
                    GradientText(
                      'Activity',
                      style: kActivityTextStyle,
                      colors: const [
                        Color(0xFFA9E7A1),
                        Color(0xFFFDD19A),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: defaultPadding * 2),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ContainerCardBitcoin(),
                      SizedBox(width: defaultPadding),
                      ContainerCardEthereum(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: defaultPadding * 2,
                  top: defaultPadding,
                  bottom: defaultPadding,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Action',
                          style: kBalanceTextStyle,
                        ),
                        Text(
                          'History',
                          style: kActivityTextStyle,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: defaultBorderRadius / 3),
                      child: Text(
                        'All',
                        style: kAllTextStyle,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                    const SizedBox(width: defaultPadding * 3),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding * 2),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ClipOval(
                        child: SizedBox(
                          height: 80,
                          child: Image.asset(kImgProfile),
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Al-Fasheer Hadji Usop',
                            style: kBalanceTextStyle,
                          ),
                          const Text(
                            'MasterCard .1004',
                            style: kMasterCardTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(width: 50),
                      Padding(
                        padding: const EdgeInsets.only(left: defaultPadding),
                        child: Text(
                              '+ \$110.23',
                              style: kProfitTextStyle,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
