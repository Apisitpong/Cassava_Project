import 'package:flutter/material.dart';

import '../../components/button_nav_bar.dart';
import '../../constants.dart';
import '../../services/price_service.dart';
import '../../่jsonfile/price_cassava.dart';
import 'cassava_home.dart';

class CassavaPrice extends StatefulWidget {
  const CassavaPrice({Key? key}) : super(key: key);

  @override
  State<CassavaPrice> createState() => _CassavaPriceState();
}

class _CassavaPriceState extends State<CassavaPrice> {
  List<PriceCassava>? price;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    price = await PriceService().getPrice();
    if (price != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cassava Price',
          style:
              TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 2),
        ),
        backgroundColor: kSecondaryColor,
        centerTitle: true,
        toolbarHeight: size.height * 0.1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(Icons.arrow_back),
          color: kSecondaryColor,
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView(
          padding: const EdgeInsets.all(14),
          children: [
            const Text(
              ' ราคารับซื้อหัวมันสด โรงแป้งจังหวัดนครราชสีมา',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('อำเภอ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('เชื้อแป้ง 30%',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('เชื้อแป้ง 25%',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: size.height * .6,
                width: size.width * .85,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(13), color: kTextColor),
                child: ListView.builder(
                  itemCount: price?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price![index].empty.toString(),
                            style: const TextStyle(fontSize: 20,),
                          ),
                          Text(price![index].the25.toString(),
                              style: const TextStyle(fontSize: 20,)),
                          Text(price![index].the30.toString(),
                              style: const TextStyle(fontSize: 20,)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPriceTable() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * .6,
        width: size.width * .85,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(0, 7),
              blurRadius: 10,
              color: kSecondaryColor.withOpacity(0.6))
        ], borderRadius: BorderRadius.circular(13), color: Colors.red),
        child: Column(
          children: [
            const Text(
              ' ราคารับซื้อหัวมันสด โรงแป้งจังหวัดนครราชสีมา',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Text('title',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('price?.length')
                    ],
                  ),
                  const Text('30per',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Text('25per',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PriceToday extends StatefulWidget {
  const PriceToday({Key? key}) : super(key: key);

  @override
  State<PriceToday> createState() => _PriceTodayState();
}

class _PriceTodayState extends State<PriceToday> {
  List<PriceCassava>? price;

  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    price = await PriceService().getPrice();
    if (price != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: price?.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(price![index].empty.toString()),
            Text(price![index].the30.toString()),
          ],
        );
      },
    );
  }
}
