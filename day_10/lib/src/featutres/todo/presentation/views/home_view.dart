import 'package:day_10/src/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../../constants/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              kImgSample,
              fit: BoxFit.cover,
            ),
          ),
          ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 40),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText(
                            'TRISHIA',
                            speed: const Duration(microseconds: 120),
                            textStyle: kAnimatedTyperTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 200,
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'BUENNE',
                                    textAlign: TextAlign.center,
                                    speed: const Duration(milliseconds: 100),
                                    textStyle: kAnimatedTypewritterTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 30,
                              left: 30,
                              right: 30,
                            ),
                            child: const Text(
                              'TRISHIA CUTIE FOREVER',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 200,
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 30,
                              right: 30,
                            ),
                            child: Center(
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  FadeAnimatedText(
                                    'TIBOOC',
                                    textAlign: TextAlign.center,
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 30,
                              left: 30,
                              right: 30,
                            ),
                            child: const Text(
                              'TRISHIA LOVELOVE KAAYO NAKO',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 200,
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                    'LOVE',
                                    colors: [
                                      Colors.deepPurple,
                                      Colors.blue,
                                    ],
                                    speed: const Duration(milliseconds: 120),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 30,
                              left: 30,
                              right: 30,
                            ),
                            child: const Text(
                              'JANUARY 10, 2023 WHEN WE FIRST TALKED',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 200,
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  WavyAnimatedText(
                                    'I MISS YOU',
                                    speed: const Duration(milliseconds: 120),
                                    textStyle: kAnimatedTypewritterTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 30,
                              left: 30,
                              right: 30,
                            ),
                            child: const Text(
                              'KITA RA TA PUHON IF MAKAKWARTA NAN IMONG BABY',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 200,
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  ScaleAnimatedText(
                                    'I LOVE YOU SO MUCH',
                                    duration: const Duration(seconds: 2),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 30,
                              left: 30,
                              right: 30,
                            ),
                            child: const Text(
                              'DI KO KABALO IEXPLAIN PA IF GAANO TIKA KALOVE',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Container(
                            height: 130,
                            width: 200,
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  RotateAnimatedText(
                                    'AL-FASHEER',
                                    textAlign: TextAlign.center,
                                    transitionHeight: 100,
                                    duration: const Duration(seconds: 2),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 30,
                              left: 30,
                              right: 30,
                            ),
                            child: const Text(
                              'MAGMAMAHAL SAYO HANGGAT KAYA KO',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 200,
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 30,
                              right: 30,
                            ),
                            child: Center(
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  FlickerAnimatedText(
                                    'HADJI USOP',
                                    textAlign: TextAlign.center,
                                    speed: const Duration(milliseconds: 1300),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 30,
                              left: 30,
                              right: 30,
                            ),
                            child: const Text(
                              'MAGIGING APILYEDO MO RIN SA SUNOD',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
