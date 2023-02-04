import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rent_ro/utiles/colors.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    Key? key,
    required this.resHeight,
    required this.title,
    required this.context,
  }) : super(key: key);

  final double resHeight;
  final String title;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
            left: resHeight * 0.04,
            right: resHeight * 0.04,
            top: resHeight * 0.06),
        child: Container(
          decoration: BoxDecoration(
            color: CommonColors.kWhite,
            borderRadius: BorderRadius.circular(resHeight * 0.03),
          ),
          height: resHeight * 0.1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: CommonColors.green,
                  ),
                ),
              ),
              Text(
                title,
                style: GoogleFonts.truculenta(
                    color: CommonColors.green, fontSize: resHeight * 0.05),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
