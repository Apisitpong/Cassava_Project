import 'package:cassava_proj/app_screens/home/cassava_calculate.dart';
import 'package:cassava_proj/app_screens/home/cassava_home.dart';
import 'package:flutter/material.dart';
import 'app_screens/home/welcome_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cassava Price',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home:  const WelcomeScreen(),
    );
  }
}

