import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/controller/Navigation/bottom_navigation_provider.dart';
import 'package:rent_ro/controller/location/location_provider.dart';
import 'package:rent_ro/controller/map_user/map_user_provider.dart';
import 'package:rent_ro/controller/payment/payment_provider.dart';
import 'package:rent_ro/controller/login/login_provider.dart';
import 'package:rent_ro/controller/otp/otp_provider.dart';
import 'package:rent_ro/controller/product/product_provider.dart';
import 'package:rent_ro/controller/search/search_provider.dart';
import 'package:rent_ro/controller/signup/signup_provider.dart';
import 'package:rent_ro/view/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupProvider>(create: (_) => SignupProvider()),
        ChangeNotifierProvider<OtpProvider>(create: (_) => OtpProvider()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<BottomNavigationProvider>(
            create: (_) => BottomNavigationProvider()),
        ChangeNotifierProvider<SelectionCommonButtonProvider>(
            create: (_) => SelectionCommonButtonProvider()),
        ChangeNotifierProvider<PaymentProvider>(
            create: (_) => PaymentProvider()),
        ChangeNotifierProvider<Searchprovider>(create: (_) => Searchprovider()),
        ChangeNotifierProvider<LocationProvider>(
            create: (_) => LocationProvider()),
        ChangeNotifierProvider<MapUserProvider>(
            create: (_) => MapUserProvider()),
        ChangeNotifierProvider<ProductProvider>(
            create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(isLoggedIn: isLoggedIn),
        // home: MapScreen(),
      ),
    );
  }
}
