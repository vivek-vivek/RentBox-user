import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_ro/utiles/colors.dart';
import 'package:rent_ro/view/assets/names.dart';
import 'package:rent_ro/view/screens/search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resHeight = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image
          ColoredBox(
            color: CommonColors.kWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: resHeight * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(resHeight * 0.04),
                        bottomRight: Radius.circular(resHeight * 0.04)),
                    image: const DecorationImage(
                      image: AssetImage(AssetsNames.tripCarImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: resHeight * 0.04, vertical: resHeight * 0.03),
                  child: Text(
                    "Why you buy ,\nWhen you can RENT .",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: resHeight * 0.07,
                      fontWeight: FontWeight.bold,
                      color: CommonColors.kBlack,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: resHeight * 0.04,
                  ),
                  child: BorderedText(
                    strokeWidth: resHeight * 0.00,
                    strokeColor: CommonColors().blackLight,
                    child: Text(
                      'TheCarRentals',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: resHeight * 0.09,
                        fontWeight: FontWeight.bold,
                        color: CommonColors.green,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Scrollable foreground
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: resHeight * 1.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      color: CommonColors.kBlack, height: resHeight * 0.06),
                  Container(
                    color: Colors.black,
                    height: sHeight * 0.20,
                    width: resHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: resHeight * 0.075,
                          backgroundColor: Colors.red.withGreen(8),
                          child: Icon(
                            Icons.card_giftcard_rounded,
                            color: Colors.white,
                            size: resHeight * 0.1,
                          ),
                        ),
                        SizedBox(
                          width: resHeight * 0.75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'We have got your back',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: resHeight * 0.05,
                                  color: CommonColors.kWhite,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                "Rest easy knowing that the Turo community is pre-screened, and customer support and roadside assistance are just a tap away.",
                                style: GoogleFonts.lato(
                                  fontSize: resHeight * 0.045,
                                  color: CommonColors.kGrey,
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    height: sHeight * 0.20,
                    width: resHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: resHeight * 0.075,
                          backgroundColor: Colors.red.withGreen(8),
                          child: Icon(
                            Icons.card_giftcard_rounded,
                            color: Colors.white,
                            size: resHeight * 0.1,
                          ),
                        ),
                        SizedBox(
                          width: resHeight * 0.75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Endless options',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: resHeight * 0.05,
                                  color: CommonColors.kWhite,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                "Choose from hundreds of models you won't find anywhere else. Pick it up or get it delivered where want it ",
                                style: GoogleFonts.lato(
                                  fontSize: resHeight * 0.045,
                                  color: CommonColors.kWhite,
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    height: sHeight * 0.40,
                    width: resHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: resHeight * 0.075,
                          backgroundColor: Colors.red.withGreen(8),
                          child: Icon(
                            Icons.card_giftcard_rounded,
                            color: Colors.white,
                            size: resHeight * 0.1,
                          ),
                        ),
                        SizedBox(
                          width: resHeight * 0.75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Drive confidently',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: resHeight * 0.05,
                                  color: CommonColors.kWhite,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  "Drive confidently with your choice of protection\nplans all plans include third party liability insurance from Travelers and varying levels of physical damage protection from Turo that caps your out-of-pocket responsibility for damage to your host's car during your trip. ",
                                  style: GoogleFonts.lato(
                                    fontSize: resHeight * 0.045,
                                    color: CommonColors.kWhite,
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: resHeight * 0.15,
                right: resHeight * 0.04,
                left: resHeight * 0.04),
            child: InkWell(
              splashColor: const Color.fromARGB(255, 71, 138, 101),
              splashFactory: InkRipple.splashFactory,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchScreen(),
              )),
              child: Container(
                decoration: BoxDecoration(
                  color: CommonColors.kWhite,
                  borderRadius: BorderRadius.circular(resHeight * 0.05),
                ),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Filter & Search",
                      style: GoogleFonts.lato(
                        fontSize: resHeight * 0.04,
                        color: CommonColors.green,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// final resHeight = MediaQuery.of(context).size.width;
