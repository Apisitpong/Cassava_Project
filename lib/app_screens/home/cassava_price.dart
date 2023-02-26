import 'package:flutter/material.dart';

import '../../components/button_nav_bar.dart';
import '../../constants.dart';

class CassavaPrice extends StatelessWidget {
  const CassavaPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundScaffold,
      body: Stack(
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
                    color: kBackgroundScaffold,
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
                  height: size.height * .45,
                  width: size.width * .85,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 7),
                            blurRadius: 10,
                            color: kSecondaryColor.withOpacity(0.6))
                      ],
                      borderRadius: BorderRadius.circular(13),
                      color: kTextColor),
                  child: const PriceToday(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PriceToday extends StatelessWidget {
  const PriceToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'แป้งมันสำปะหลัง 25%',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                'วันนี้ :',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                '7 วันที่แล้ว :',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            'แป้งมันสำปะหลัง 30%',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                'วันนี้ :',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                '7 วันที่แล้ว :',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
