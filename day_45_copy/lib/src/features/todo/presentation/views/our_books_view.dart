import 'package:day_45_copy/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../data/data_sources/arrays.dart';

class OurBooksView extends StatefulWidget {
  const OurBooksView({super.key});

  @override
  State<OurBooksView> createState() => _OurBooksViewState();
}

class _OurBooksViewState extends State<OurBooksView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  kImgOurBooksViewTopDesign,
                  width: size.width,
                  fit: BoxFit.fitWidth,
                ),
                AppBar(
                  backgroundColor: kTransparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                Container(
                  height: size.width * 0.9,
                  alignment: Alignment.bottomLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: imageArr.map(
                        (iName) {
                          var isFirst = imageArr.first == iName;
                          var isLast = imageArr.last == iName;
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: isFirst
                                ? const EdgeInsets.only(left: 15)
                                : (isLast
                                    ? const EdgeInsets.only(right: 15)
                                    : null),
                            child: Image.asset(
                              iName,
                              height: 120,
                              fit: BoxFit.fitHeight,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 20,
              ),
              child: Text(
                """Unbeatable Discounted Books for Every Reader

Book Grocer isn't your average discount bookstore. We offer a treasure trove of discounted remainder and secondhand books, all meticulously chosen for amazing quality and incredible value.

Quality You Can Trust, Prices You'll Love

We source books from all over the globe, working with publishers and suppliers to find the best bargains. But here's the thing: a cheap price isn't enough for us. Every book on our shelves is one we'd happily recommend to a friend – because we're passionate readers ourselves!

Discount Prices, Bookstore Vibes

We believe discounted books shouldn't mean a compromised experience. That's why we strive to create a welcoming atmosphere that feels just like your favorite retail bookstore.

A Family Affair, Established in 2000

Book Grocer is a proudly Australian, family-owned business. We started our journey in 2000 with the first Castlebooks store, and in 2007, Book Grocer was born! Today, you can find us in various locations across Victoria, NSW, and Canberra.

Enthusiastic Staff, Expert Recommendations

Our team is brimming with bookworms who love nothing more than sharing their passion with others. They're experts at recommending the perfect read, whether you're searching for a specific genre or simply looking to discover your next favorite book.

Come Experience the Difference at Book Grocer!

We invite you to explore our incredible selection of discounted books and rediscover the joy of getting lost in a good story.""",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kSubTitle,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
