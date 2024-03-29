import 'package:day_45_copy/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/arrays.dart';
import '../widgets/your_review_row.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: kTransparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: kPrimary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 25,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Will Newman',
                          style: kSearchFilterTextStyle,
                        ),
                        Text(
                          'Constantly travelling and keeping up to date with business related books.',
                          style: kAccountViewTextStyle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      kImgProfile,
                      width: 70,
                      height: 70,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Icon(
                    Icons.near_me_sharp,
                    color: kSubTitle,
                    size: 15,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Newcastle - Australia',
                      style: kAccountViewTextStyle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: kButton),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: kPrimary,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kTransparent,
                        shadowColor: kTransparent,
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 25,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '21',
                        style: kAccountviewNumberTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Books',
                        style: kAccountViewBooksTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '5',
                        style: kAccountviewNumberTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Reviews',
                        style: kAccountViewBooksTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 25,
              ),
              child: Text(
                'Your purchases (21)',
                style: kAccountViewPurchasesTextStyle,
              ),
            ),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: size.width * 0.4,
                  width: size.width * 0.45,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF5957),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: purArr.map(
                      (iName) {
                        var isFirst = purArr.first == iName;
                        var isLast = purArr.last == iName;
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 12,
                          ),
                          padding: isFirst
                              ? const EdgeInsets.only(left: 25)
                              : (isLast
                                  ? const EdgeInsets.only(right: 25)
                                  : null),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                iName,
                                height: size.width * 0.5,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 25,
              ),
              child: Text(
                'Your reviews (7)',
                style: kAccountViewPurchasesTextStyle,
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 25,
              ),
              itemCount: sResultArr.length,
              itemBuilder: (context, index) {
                var rObj = sResultArr[index] as Map? ?? {};
                return YourReviewRow(sObj: rObj);
              },
            ),
          ],
        ),
      ),
    );
  }
}
