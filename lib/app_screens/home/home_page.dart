// import 'package:cassava_proj/app_screens/home/welcome_screens.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'cassava_home.dart';
//
// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasData) {
//             //return SignIn();
//             return const WelcomeScreen();
//           } else if (snapshot.hasError) {
//             return const Center(
//               child: Text("Something Wrong"),
//             );
//           } else {
//             return const WelcomeScreen();
//           }
//         }),
//   );
// }