import 'package:flutter/material.dart';

import '../../components/button_nav_bar.dart';
import '../../constants.dart';

class CassavaPrice extends StatelessWidget {
  const CassavaPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.32,
          decoration: const BoxDecoration(color: kSecondaryColor),
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
                'Cassava Price ',
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
