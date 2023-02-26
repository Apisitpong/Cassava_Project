import 'package:cassava_proj/constants.dart';
import 'package:flutter/material.dart';

import '../app_screens/home/cassava_calculate.dart';
import '../app_screens/home/cassava_favorite.dart';
import '../app_screens/home/cassava_home.dart';
import '../app_screens/home/cassava_price.dart';
import '../app_screens/home/cassava_profile.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: tabIndex,
        children: const [
          CassavaHome(),
          CassavaPrice(),
          CassavaPrice(),
          CassavaFavorite(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [
          BoxShadow(
              offset: const Offset(0, 7),
              blurRadius: 30,
              color: kSecondaryColor.withOpacity(0.6))
        ]),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 4,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: tabIndex,
            onTap: changeTabIndex,
            selectedFontSize: 12,
            selectedItemColor: kSecondaryColor,
            unselectedItemColor: Colors.grey.shade300,
            items: [
              itemNavBar(Icons.forum, 'News'),
              itemNavBar(Icons.trending_up, 'Price'),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.transparent,
                  ),
                  label: ''),
              itemNavBar(Icons.bookmark_sharp, 'Favorite'),
              itemNavBar(Icons.person, 'Profile'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSecondaryColor,
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CassavaCalculate())),
        child: const Icon(
          Icons.attach_money_sharp,size: 30,
          color: Color(0xFFCFB53B)  ,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  itemNavBar(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
