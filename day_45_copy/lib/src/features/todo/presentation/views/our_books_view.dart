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
                """The Book Grocer online offers a broad and ever increasing range of discounted remainder and secondhand books.
            
            Our specialty is sourcing discounted books of amazing quality and passing on to our customers the best possible price.
            We take our book buying very seriously indeed. We scour the globe and the best publishers and suppliers for the best bargains, but no book simply arrives in our warehouse simply because it's cheap. It has to be something we want to read ourselves and would reccomend to others.
            We like to be known as the business which sells discounted books yet looks and feels like a retail bookstore.
            
            We are an Australian, family-owned business. We have been buying and selling books since 2000, when the first Castlebooks store opened in Kingston, ACT.
            
            In 2007 we opened the first Book Grocer in Brunswick, Victoria. Book Grocers can now be found in a range of locations across Victoria, NSW, and of course, Canberra.
            
            Our staff also love reading and recommending books to others and we are proud of the role they play in demonstrating to our customers how good discount books can be.""",
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
