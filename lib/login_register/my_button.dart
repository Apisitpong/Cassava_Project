import 'package:flutter/material.dart';

import '../constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.textButton, required this.color}) : super(key: key);

  final String textButton;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(8)),
      child: Center(
          child: Text(
        textButton,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }
}
