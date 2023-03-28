import 'package:flutter/material.dart';

import '../../components/button_nav_bar.dart';
import '../../constants.dart';
import 'cassava_home.dart';

class CassavaCalculate extends StatefulWidget {
  const CassavaCalculate({Key? key}) : super(key: key);

  @override
  State<CassavaCalculate> createState() => _CassavaCalculateState();
}

class _CassavaCalculateState extends State<CassavaCalculate> {
  int currentIndex = 0;
  String result = '';
  TextEditingController thrControllor = TextEditingController();
  TextEditingController twoControllor = TextEditingController();
  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kTextColor,
        appBar: AppBar(
          backgroundColor: kSecondaryColor,
          centerTitle: true,
          toolbarHeight: size.height * 0.1,
          title: const Text(
            'Cassava Calculate',
            style:
                TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 2),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: const Icon(Icons.arrow_back),
            color: kSecondaryColor,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton('เชื้อแป้ง 30% ', kSecondaryColor, 0),
                    radioButton('เชื้อแป้ง 25% ', kSecondaryColor, 1),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'ราคา : 3.33',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'แปลงที่ดินด้านกว้าง :',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: thrControllor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'กรุณาใส่ที่ดินด้านกว้าง หน่วย เมตร',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none)),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'แปลงที่ดินด้านยาว :',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: twoControllor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'กรุณาใส่ที่ดินด้านยาว หน่วย เมตร',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none)),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      double thr = double.parse(thrControllor.value.text);
                      double two = double.parse(twoControllor.value.text);
                      calculatePrice(thr, two);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: kSecondaryColor),
                    child: const Text(
                      'คำนวนรายได้',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'ราคาขายสุทธิ :',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    '$result บาท',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void calculatePrice(double thr, double two) {
    double finalResult = thr / two;
    String price = finalResult.toStringAsFixed(2);
    setState(() {
      result = price;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: 80,
        width: 100,
        child: ElevatedButton(
          onPressed: () {
            changeIndex(index);
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor:
                  currentIndex == index ? kSecondaryColor : Colors.grey[200]),
          child: Text(
            value,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: currentIndex == index
                    ? kPrimaryColor
                    : color.withOpacity(0.5)),
          ),
        ),
      ),
    ));
  }
}
