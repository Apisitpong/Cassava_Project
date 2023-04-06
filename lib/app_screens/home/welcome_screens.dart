import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import 'cassava_home.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/home_screen.PNG'),
              fit: BoxFit.fill),
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 110),
          child: Column(
            children: [
              Stack(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 110,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/มันสำปะหลัง-ตัด.jpg'),
                      radius: 108,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Container(
                padding: const EdgeInsets.only(top: 70, left: 30),
                alignment: Alignment.centerLeft,
                child:  Text('CASSAVA',
                  style: GoogleFonts.getFont('Prompt',
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: kTextColor),),
              ),

              Container(
                padding: const EdgeInsets.only(top: 10, left: 35, bottom: 50),
                alignment: Alignment.centerLeft,
                child:  Text(
                    'An app that calculates farmland\nincome for the convenience and \nspeed of the farmland.',
                  style: GoogleFonts.getFont('Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kTextSecondColor),),
              ),
              const SizedBox(height: 24,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>  const HomePage()));
                },
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 50, left: 200),
                    height: 50,
                    width: 140,
                    decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child:  Text(
                      'Get Started',
                      style: GoogleFonts.getFont('Prompt',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
