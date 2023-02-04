import 'package:flutter/material.dart';
import 'package:rent_ro/utiles/colors.dart';

class DialogeMessages {
  SnackBar commonSnackBar(
      {String text = '',
      Color bgColor = CommonColors.kBlack,
      Color textColor = CommonColors.kWhite}) {
    return SnackBar(
      clipBehavior: Clip.hardEdge,
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15.0),
      elevation: 6.0,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      content: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
