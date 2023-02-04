import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_ro/utiles/colors.dart';
import 'package:rent_ro/view/assets/names.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resHeight = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CommonColors.kBlack,
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: 4,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: resHeight.height * 0.05,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: resHeight.height * 0.25,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AssetsNames.carRetro2),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: resHeight.width * 0.5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: resHeight.width * 1,
                          child: Text(
                            "Chavarolt Coveette Stinger",
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: resHeight.width * 0.075),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Text(
                          "5.0 * Rating ",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: resHeight.width * 0.055),
                          textAlign: TextAlign.start,
                        ),
                        const Divider(
                            color: CommonColors.kGrey, thickness: 1.5),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Indin Rupees 2999/day",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: resHeight.width * 0.055,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: CommonColors.amber,
                        size: resHeight.width * 0.1,
                      )),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
