import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rent_ro/view/screens/favorits/favorites_screen.dart';
import 'package:rent_ro/view/screens/home_screen.dart';
import 'package:rent_ro/view/screens/notification_screen.dart';
import 'package:rent_ro/view/screens/profile_screen.dart';
import 'package:rent_ro/utiles/colors.dart';

class BottomNavigationProvider with ChangeNotifier {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const FavoritesScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];
  void initState() {
    selectedIndex = 0;
  }

  onPageChange(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

class SelectionCommonButtonProvider with ChangeNotifier {
  bool isPressed = false;
  Color buttonColor = Colors.white;
  Color textColor = Colors.black;

  void toggle() {
    isPressed = !isPressed;
    buttonColor = isPressed == true
        ? CommonColors.kGrey.withOpacity(0.15)
        : CommonColors.kWhite;
    textColor = isPressed == true ? Colors.grey : Colors.black;
    log(isPressed.toString());
    notifyListeners();
  }
}
