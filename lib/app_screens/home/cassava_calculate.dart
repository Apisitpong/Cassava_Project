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
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundScaffold,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        centerTitle: true,
        title: const Text('Cassava Calculate',style: TextStyle(color: kBackgroundScaffold),),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Container(
          height: size.height * .8,
          width: size.width * .85,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 7),
                    blurRadius: 10,
                    color: kSecondaryColor.withOpacity(0.6))
              ],
              borderRadius: BorderRadius.circular(13), color: kTextColor),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'กว้าง',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(8),
                        height: size.height * .2,
                        width: size.width * .5,
                        color: Colors.grey[300],
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/ellipse-6.png',
                              height: 120,
                              width: 50,
                            ),
                            Image.asset(
                              'assets/images/ellipse-7.png',
                              height: 120,
                              width: 130,
                              alignment: Alignment.bottomCenter,
                              //color: _active ? Colors.black : kTextColor,
                            )
                          ],
                        )),
                    const Text(
                      'ยาว',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'ขนาดแปลงที่ดิน ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'ด้านกว้าง :',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    const Text(
                      'เมตร',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      ' ด้านยาว :',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    const Text(
                      'เมตร',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: kSecondaryColor),
                    onPressed: () {}, child: Text('Calculate')),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'ราคาที่คำนวนได้ ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'บาท',
                      style: TextStyle(fontSize: 14),
                    ),
                    IconButton(
                        onPressed: (){}, icon: Icon(Icons.bookmark_outline))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
