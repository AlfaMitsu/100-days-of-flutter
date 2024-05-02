import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/pop_view_wrapper.dart';
import 'home_view_cta.dart';
import 'pop_show_case.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Widget _ctaWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: Column(
          children: [
            HomeViewCta(
              childPath: 'lib/src/resources/assets/svg/cta_text_main_btn.svg',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PopShowCase(initialIndex: 0),
                ),
              ),
            ),
            const SizedBox(height: 15),
            HomeViewCta(
              childPath:
                  'lib/src/resources/assets/svg/cta_text_primary_btn.svg',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PopShowCase(initialIndex: 1),
                ),
              ),
            ),
            const SizedBox(height: 15),
            HomeViewCta(
              childPath:
                  'lib/src/resources/assets/svg/cta_text_secondary_btn.svg',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PopShowCase(initialIndex: 2),
                ),
              ),
            ),
            const SizedBox(height: 15),
            HomeViewCta(
              childPath: 'lib/src/resources/assets/svg/cta_text_advanced.svg',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PopShowCase(initialIndex: 3),
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return PopViewWrapper(
      child: Column(
        children: [
          const Expanded(
            flex: 4,
            child: SizedBox(),
          ),
          SvgPicture.asset(
            'lib/src/resources/assets/svg/logo.svg',
            height: 45,
          ),
          const Expanded(
            flex: 4,
            child: SizedBox(),
          ),
          SvgPicture.asset(
              'lib/src/resources/assets/svg/neopop_framework_text.svg'),
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),
          _ctaWidget(context),
          const Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
