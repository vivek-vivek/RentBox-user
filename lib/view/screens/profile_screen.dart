import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_ro/utiles/colors.dart';
import 'package:rent_ro/view/assets/names.dart';
import 'package:rent_ro/view/screens/product/product_screen.dart';
import 'package:rent_ro/view/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rsize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CommonColors.kBlack,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: rsize.width * 0.05,
              left: rsize.width * 0.05,
              right: rsize.width * 0.05),
          child: Column(
            children: [
              HeaderProfileWidget(rsize: rsize),
              SizedBox(height: rsize.width * 0.1),
              BecomhostBanner(rsize: rsize),
              SizedBox(height: rsize.width * 0.1),
              Row(
                children: [
                  Icon(
                    Icons.person_2_outlined,
                    color: Colors.white,
                    size: rsize.width * 0.08,
                  ),
                  SizedBox(width: rsize.width * 0.025),
                  TextButton(
                    onPressed: () {},
                    child: SmallTexts(
                      fontSize: 0.05,
                      title: 'Account',
                      rsize: rsize,
                      color: CommonColors.kWhite,
                    ),
                  )
                ],
              ),
              SizedBox(height: rsize.width * 0.025),
              Row(
                children: [
                  Icon(
                    Icons.car_repair_outlined,
                    color: Colors.white,
                    size: rsize.width * 0.08,
                  ),
                  SizedBox(width: rsize.width * 0.025),
                  TextButton(
                    onPressed: () {},
                    child: SmallTexts(
                      fontSize: 0.05,
                      title: 'Orderhistory',
                      rsize: rsize,
                      color: CommonColors.kWhite,
                    ),
                  )
                ],
              ),
              SizedBox(height: rsize.width * 0.025),
              Row(
                children: [
                  Icon(
                    Icons.card_giftcard_rounded,
                    color: Colors.white,
                    size: rsize.width * 0.08,
                  ),
                  SizedBox(width: rsize.width * 0.025),
                  TextButton(
                    onPressed: () {},
                    child: SmallTexts(
                      fontSize: 0.05,
                      title: 'GiftCards',
                      rsize: rsize,
                      color: CommonColors.kWhite,
                    ),
                  )
                ],
              ),
              SizedBox(height: rsize.width * 0.025),
              Row(
                children: [
                  Icon(
                    Icons.support_agent_rounded,
                    color: Colors.white,
                    size: rsize.width * 0.08,
                  ),
                  SizedBox(width: rsize.width * 0.025),
                  TextButton(
                    onPressed: () {},
                    child: SmallTexts(
                      fontSize: 0.05,
                      title: 'Contact Support',
                      rsize: rsize,
                      color: CommonColors.kWhite,
                    ),
                  )
                ],
              ),
              SizedBox(height: rsize.width * 0.025),
              Row(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                    size: rsize.width * 0.08,
                  ),
                  SizedBox(width: rsize.width * 0.025),
                  TextButton(
                    onPressed: () async {
                      ///LOGOUT
                      final prefs = await SharedPreferences.getInstance();
                      prefs.remove("isLoggedIn");
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              SplashScreen(isLoggedIn: false)));
                    },
                    child: SmallTexts(
                      fontSize: 0.05,
                      title: 'Log out',
                      rsize: rsize,
                      color: CommonColors.kWhite,
                    ),
                  )
                ],
              ),
              SizedBox(height: rsize.width * 0.025),
            ],
          ),
        ),
      ),
    );
  }

  Future logOut(context) async {}
}

class BecomhostBanner extends StatelessWidget {
  const BecomhostBanner({
    super.key,
    required this.rsize,
  });

  final Size rsize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: rsize.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(rsize.width * 0.04)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 5, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallTexts(
                    fontW: true,
                    fontSize: 0.06,
                    title: 'Become a host',
                    rsize: rsize,
                    color: CommonColors.green),
                SizedBox(height: rsize.width * 0.025),
                SmallTexts(
                    fontSize: 0.05,
                    title:
                        'Join thousends of hosts\nbuilding businesses and\nearning meaningfull income on\nRentBox',
                    rsize: rsize,
                    color: CommonColors.kBlack),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CommonColors.green,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Learn More",
                    style: GoogleFonts.truculenta(
                        color: CommonColors.kWhite,
                        fontSize: rsize.width * 0.05,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: rsize.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(rsize.width * 0.04),
                    bottomRight: Radius.circular(rsize.width * 0.04)),
                image: const DecorationImage(
                  image: AssetImage(AssetsNames.tripCarImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderProfileWidget extends StatelessWidget {
  const HeaderProfileWidget({
    super.key,
    required this.rsize,
  });

  final Size rsize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: CommonColors.red,
          radius: rsize.width * 0.075,
        ),
        const SizedBox(width: 10),
        SmallTexts(
            fontSize: 0.06,
            title: 'Rajappan',
            rsize: rsize,
            color: CommonColors.kWhite)
      ],
    );
  }
}
