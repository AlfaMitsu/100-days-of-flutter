import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class DraggableSheetCard extends StatefulWidget {

  const DraggableSheetCard({
    super.key,
  });

  @override
  State<DraggableSheetCard> createState() => _DraggableSheetCardState();
}

class _DraggableSheetCardState extends State<DraggableSheetCard> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
              color: Color.fromRGBO(243, 245, 248, 1),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40))),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 24,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Your Cards",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 24,
                                color: Colors.black),
                          ),
                          Text(
                            "2 Physical Card, and 1 Virtual Card",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz,
                          color: Colors.lightBlue[900],
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    children: <Widget>[
                      //copy same button
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: kGrey200Color,
                                  blurRadius: 10.0,
                                  spreadRadius: 4.5)
                            ]),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          "Physical Card",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.grey[900]),
                        ),
                      ),

                      const SizedBox(
                        width: 16,
                      ),

                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: kGrey200Color,
                                  blurRadius: 10.0,
                                  spreadRadius: 4.5)
                            ]),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          "Virtual Card",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.grey[900]),
                        ),
                      ),
                    ],
                  ),
                ),

                //Container for card
                const SizedBox(
                  height: 16,
                ),

                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(35, 60, 103, 1),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Color.fromRGBO(50, 172, 121, 1),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            Text(
                              "VISA",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Text(
                          "**** **** **** 5647",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.0),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "CARD HOLDER",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue[100],
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.0),
                                ),
                                Text(
                                  "Maaz Aftab",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[100],
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.0),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "EXPIRES",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue[100],
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.0),
                                ),
                                Text(
                                  "8/22",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[100],
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.0),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "CVV",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue[100],
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.0),
                                ),
                                Text(
                                  "845",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[100],
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.0),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )),

                const SizedBox(
                  height: 16,
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: const Text(
                    "Card Settings",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: kGrey200Color,
                            spreadRadius: 10.0,
                            blurRadius: 4.5)
                      ]),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.wifi_tethering,
                            color: Colors.lightBlue[900],
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Card Settings",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Switch(
                        value: switchValue,
                        activeColor: const Color.fromRGBO(50, 172, 121, 1),
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: kGrey200Color,
                            spreadRadius: 10.0,
                            blurRadius: 4.5)
                      ]),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            color: Colors.lightBlue[900],
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Online Payment",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Switch(
                        value: true,
                        activeColor: const Color.fromRGBO(50, 172, 121, 1),
                        onChanged: (_) {},
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: kGrey200Color,
                            spreadRadius: 10.0,
                            blurRadius: 4.5)
                      ]),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.mobile_screen_share,
                            color: Colors.lightBlue[900],
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            "ATM Withdraws",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Switch(
                        value: true,
                        activeColor: const Color.fromRGBO(50, 172, 121, 1),
                        onChanged: (_) {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      initialChildSize: 0.65,
      minChildSize: 0.65,
      maxChildSize: 1,
    );
  }
}
