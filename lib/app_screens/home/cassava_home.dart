import 'package:flutter/material.dart';

import '../../constants.dart';
import 'cassava_calculate.dart';
import 'cassava_favorite.dart';
import 'cassava_price.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    const CassavaHome(),
    const CassavaPrice(),
    const CassavaCalculate(),
    const CassavaFavorite(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: ButtonNavBar(context),
      backgroundColor: kBackgroundColor,
    );
  }

  Widget ButtonNavBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        decoration:  BoxDecoration(
          color: kSecondaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const CircleAvatar(
                radius: 25,
                backgroundColor: kSecondaryColor,
                child: Icon(
                  Icons.home_filled,
                  color: kPrimaryColor,
                  size: 25,
                ),
              )
                  : const Icon(
                Icons.home_outlined,
                color: kSecondaryColor,
                size: 25,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const CircleAvatar(
                backgroundColor: kSecondaryColor,
                child: Icon(
                  Icons.trending_up,
                  color: kPrimaryColor,
                  size: 25,
                ),
              )
                  : const Icon(
                Icons.trending_up,
                color: kSecondaryColor,
                size: 25,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const CircleAvatar(
                backgroundColor: kSecondaryColor,
                child: Icon(
                  Icons.bookmark_sharp,
                  color: kPrimaryColor,
                  size: 25,
                ),
              )
                  : const Icon(
                Icons.bookmark_outline,
                color: kSecondaryColor,
                size: 25,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? const CircleAvatar(
                backgroundColor: kSecondaryColor,
                child: Icon(
                  Icons.person,
                  color: kPrimaryColor,
                  size: 25,
                ),
              )
                  : const Icon(
                Icons.person_outline,
                color: kSecondaryColor,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CassavaHome extends StatelessWidget {
  const CassavaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.32,
          decoration: const BoxDecoration(
            color: kSecondaryColor,
          ),
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, right: 20),
              alignment: Alignment.topRight,
              child: const Icon(
                Icons.account_circle_sharp,
                size: 50,
                color: kBackgroundColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 35),
              alignment: Alignment.topLeft,
              child: const Text(
                'Cassava NEWS ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 2,
                  color: kTextColor,
                ),
              ),
            ),
            const Divider(
              color: kTextColor,
              indent: 30,
              endIndent: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: Container(
                height: size.height * .6,
                width: size.width * .85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13), color: kTextColor),
              ),
            )
          ],
        )
      ],
    );
  }
}
