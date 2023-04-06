import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/button_nav_bar.dart';
import '../../constants.dart';
import '../../services/price_service.dart';
import '../../่jsonfile/price_cassava.dart';
import 'cassava_home.dart';

class CassavaCalculate extends StatefulWidget {
  const CassavaCalculate({Key? key}) : super(key: key);

  @override
  State<CassavaCalculate> createState() => _CassavaCalculateState();
}

class _CassavaCalculateState extends State<CassavaCalculate> {
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
      //comment ไว้ เพราะจะได้ปรับ Dark mode ได้
        //backgroundColor: kTextColor,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          toolbarHeight: size.height * 0.1,
          title:  Text(
            'คำนวนรายได้',
            style: GoogleFonts.getFont('Prompt',
                fontSize: 24, fontWeight: FontWeight.bold, height: 2),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.teal,
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
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    currentIndex == 0 ? '3.60 - 3.65' : '3.20 - 3.25',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Prompt',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: currentIndex == 0 ? kPrimaryColor : Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  'แปลงที่ดินด้านกว้าง :',
                  style: GoogleFonts.getFont('Prompt',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
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
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none)),
                ),
                const SizedBox(
                  height: 20,
                ),
                 Text(
                  'แปลงที่ดินด้านยาว :',
                  style: GoogleFonts.getFont('Prompt',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
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
                      hintStyle: const TextStyle(color: Colors.grey),
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
                    child:  Text(
                      'คำนวนรายได้',
                      style: GoogleFonts.getFont('Prompt',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                 SizedBox(
                  width: double.infinity,
                  child: Text(
                    'ราคาขายสุทธิ :',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Prompt',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    result == '' ? '' : '$result บาท',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Prompt',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  //สูตรคำนวน
  //1600 คือพท. 1 ไร่ = 1600 ตรม.
  //11520 คือ ราคาที่ได้ / ไร่
  void calculatePrice(double thr, double two) {
    double finalResult = ((thr * two) / 1600) * 11520;
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
            style: GoogleFonts.getFont('Prompt',
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

