import 'package:flutter/material.dart';

import '../../components/button_nav_bar.dart';
import '../../constants.dart';
import 'cassava_home.dart';

class CassavaCalculate extends StatelessWidget {
  const CassavaCalculate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        centerTitle: true,
        title: const Text('Cassava Calculate'),
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
          height: size.height * .6,
          width: size.width * .85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13), color: kTextColor),
        ),
      ),
    );
  }
}
