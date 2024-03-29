import 'package:flutter/material.dart';

import '../../widgets/color_extension.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  List imagesArr = [
    "lib/src/resources/assets/images/d1.png",
    "lib/src/resources/assets/images/d2.png",
    "lib/src/resources/assets/images/d3.png",
    "lib/src/resources/assets/images/d4.png",
    "lib/src/resources/assets/images/d5.png",
    "lib/src/resources/assets/images/d6.png",
    "lib/src/resources/assets/images/d7.png",
    "lib/src/resources/assets/images/d8.png",
    "lib/src/resources/assets/images/d9.png",
    "lib/src/resources/assets/images/d10.png",
    "lib/src/resources/assets/images/d11.png",
    "lib/src/resources/assets/images/d12.png"
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "lib/src/resources/assets/images/chat.png",
            width: 35,
            height: 35,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Logo",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(17.5),
              child: Image.asset(
                "lib/src/resources/assets/images/user_profile.png",
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              "lib/src/resources/assets/images/user_profile.png",
              width: media.width,
              fit: BoxFit.fitWidth,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: media.width,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "135",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "posts",
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "5,321k",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "followers",
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "99",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "following",
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(17.5),
                        child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: TColor.primary,
                            borderRadius: BorderRadius.circular(17.5),
                          ),
                          child: const Text(
                            "Friend Request",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: media.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            offset: Offset(0, -15))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jenna Feranandez",
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Creative Designer ",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "@ArgoRadius",
                              style: TextStyle(
                                color: TColor.primary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(
                          TextSpan(
                              text:
                                  "Obsessed with Fahim MD's YouTube channel, love to go shopping on weekends and loveee food ",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: "#foodielife",
                                  style: TextStyle(
                                    color: TColor.primary,
                                    fontSize: 14,
                                  ),
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GridView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 116 / 100,
                            ),
                            itemCount: imagesArr.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  imagesArr[index] as String? ?? "",
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                  fit: BoxFit.cover,
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
