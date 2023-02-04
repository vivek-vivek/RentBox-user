import 'package:flutter/material.dart';
import 'package:rent_ro/utiles/colors.dart';
import 'package:rent_ro/view/screens/favorits/favorites_screen.dart';
import 'package:rent_ro/view/screens/home_screen.dart';
import 'package:rent_ro/view/screens/notification_screen.dart';
import 'package:rent_ro/view/screens/profile_screen.dart';

class MyAppScreen extends StatefulWidget {
  const MyAppScreen({super.key});

  @override
  MyAppScreenState createState() => MyAppScreenState();
}

class MyAppScreenState extends State<MyAppScreen> {
  int _currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const FavoritesScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final respHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CommonColors.kBlack,
        selectedIconTheme: IconThemeData(size: respHeight * 0.06),
        selectedItemColor: CommonColors.red,
        unselectedItemColor: CommonColors.kWhite,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home, size: respHeight * 0.065),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon:
                Icon(Icons.favorite_outline_outlined, size: respHeight * 0.065),
            label: 'Favorits',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.crisis_alert_sharp, size: respHeight * 0.065),
            label: 'Trips',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.notifications_none_outlined,
                size: respHeight * 0.065),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.more_horiz_rounded, size: respHeight * 0.065),
            label: 'More',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
