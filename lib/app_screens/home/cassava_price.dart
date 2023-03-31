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
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  priceBox(
                      'เชื้อแป้ง 30% :',
                      price![index].thrpercent.toString(),
                      kSecondaryColor.withOpacity(0.9)),
                  const SizedBox(
                    height: 8,
                  ),
                  priceBox(
                      'เชื้อแป้ง 25% :',
                      price![index].twopercent.toString(),
                      Colors.indigo),
                  const SizedBox(
                    height: 8,
                  ),
                  priceBox('กากแห้ง :', price![index].dryresidue.toString(),
                      Colors.blue),
                  const SizedBox(
                    height: 8,
                  ),
                  priceBox('มันเส้น :', price![index].chip.toString(),
                      kPrimaryColor),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget priceBox(String title, String price, Color color) {
    return Container(
        height: 120,
        width: double.infinity,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Text(
                    '(บาท/กก.)',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
  // Widget buildPriceTable() {
  //   var size = MediaQuery.of(context).size;
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       height: size.height * .6,
  //       width: size.width * .85,
  //       decoration: BoxDecoration(boxShadow: [
  //         BoxShadow(
  //             offset: const Offset(0, 7),
  //             blurRadius: 10,
  //             color: kSecondaryColor.withOpacity(0.6))
  //       ], borderRadius: BorderRadius.circular(13), color: Colors.red),
  //       child: Column(
  //         children: [
  //           const Text(
  //             ' ราคารับซื้อหัวมันสด โรงแป้งจังหวัดนครราชสีมา',
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Column(
  //                   children: const [
  //                     Text('title',
  //                         style: TextStyle(
  //                             fontSize: 18, fontWeight: FontWeight.bold)),
  //                     Text('price?.length')
  //                   ],
  //                 ),
  //                 const Text('30per',
  //                     style:
  //                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //                 const Text('25per',
  //                     style:
  //                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
