// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rent_ro/utiles/colors.dart';

Container kContainer(
    {double xHeight = 0,
    double xWidth = 0,
    Color xColor = Colors.transparent}) {
  return Container(
    height: xHeight,
    width: xWidth,
    color: xColor,
  );
}

// normal Boxdecorations for containers
BoxDecoration kBoxDecoration(
    {double resHeight = 0,
    Color color = CommonColors.kWhite,
    double blurRadiusSizeOF = 0.035,
    double borderRadiusOf = 0.030}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(resHeight * borderRadiusOf),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0, 6),
        blurRadius: 6.0,
        spreadRadius: 2,
      ),
    ],
  );
}

InputDecoration commonTextfeildDecoration(double respHeight, String label) {
  return InputDecoration(
    labelText: label,
    floatingLabelStyle: TextStyle(
      fontSize: respHeight * 0.05,
      color: CommonColors.kBlack,
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular((respHeight * 0.4))),
    labelStyle: GoogleFonts.anybody(
        color: CommonColors.kBlack, fontSize: respHeight * 0.035),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(respHeight * 0.02)),
      borderSide:
          BorderSide(width: respHeight * 0.003, color: CommonColors.kRed),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(respHeight * 0.02)),
      borderSide:
          BorderSide(width: respHeight * 0.003, color: CommonColors.kGrey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(respHeight * 0.02)),
      borderSide: BorderSide(
        width: respHeight * 0.003,
        color: CommonColors.kGrey,
      ),
    ),
    hintStyle: TextStyle(
      color: Colors.grey.shade500,
    ),
    fillColor: Colors.grey.shade300,
    filled: true,
  );
}

/// Decoration for TextFormfeild  in login and signup
InputDecoration kInputDecoration(resHeight, String label) {
  return InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(resHeight * 0.02)),
    label: Text(
      label,
      style: GoogleFonts.anybody(
          color: CommonColors.kBlack, fontSize: resHeight * 0.035),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(resHeight * 0.02)),
      borderSide:
          BorderSide(width: resHeight * 0.003, color: CommonColors.kRed),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(resHeight * 0.02)),
      borderSide:
          BorderSide(width: resHeight * 0.003, color: CommonColors.kGrey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(resHeight * 0.02)),
      borderSide: BorderSide(
        width: resHeight * 0.003,
        color: CommonColors.kGrey,
      ),
    ),
  );
}
