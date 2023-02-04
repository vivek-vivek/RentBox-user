import 'package:flutter/material.dart';
import 'package:rent_ro/view/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            logOut(context);
          },
          child: const Icon(
            Icons.baby_changing_station_outlined,
            size: 100,
          )),
    );
  }

  Future logOut(context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("isLoggedIn");
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => SplashScreen(isLoggedIn: false)));
  }
}
