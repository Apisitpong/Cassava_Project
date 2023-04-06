import 'package:cassava_proj/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../app_screens/home/cassava_calculate.dart';
import '../app_screens/home/cassava_favorite.dart';
import '../app_screens/home/cassava_home.dart';
import '../app_screens/home/cassava_price.dart';
import '../app_screens/home/settings/cassava_profile.dart';
import '../login_register/login_page.dart';

class ButtonNavBar extends StatefulWidget {
  const ButtonNavBar({Key? key}) : super(key: key);

  @override
  State<ButtonNavBar> createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<ButtonNavBar> {
  int tabIndex = 0;
  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  //final auth = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: tabIndex,
        children:   const [
           CassavaHome(),
           CassavaPrice(),
           CassavaCalculate(),
           // CassavaFavorite(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4,
        child: BottomNavigationBar(
          backgroundColor: kTextColor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: tabIndex,
          onTap: changeTabIndex,
          selectedFontSize: 12,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey.shade300,
          items: [
            itemNavBar(Icons.forum, 'News'),
            itemNavBar(Icons.trending_up, 'Price'),
            // const BottomNavigationBarItem(
            //     icon: Icon(
            //       Icons.home,
            //       color: Colors.transparent,
            //     ),
            //     label: ''),
            itemNavBar(Icons.attach_money_sharp, 'Calculate'),
            itemNavBar(Icons.settings, 'Settings'),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kSecondaryColor,
      //   onPressed: () => Navigator.of(context).push(
      //       MaterialPageRoute(builder: (context) => const CassavaCalculate())),
      //   child: const Icon(
      //     Icons.attach_money_sharp,
      //     size: 30,
      //     color: Color(0xFFCFB53B),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  itemNavBar(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
