import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rent_ro/view/widgets/dialoge_messages.dart';

Future internetConncetionCheck(context) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        DialogeMessages().commonSnackBar(text: 'No Internet concetion'),
      );
    }
  } on SocketException catch (_) {
    ScaffoldMessenger.of(context).showSnackBar(
      DialogeMessages().commonSnackBar(text: 'No Internet concetion'),
    );
  }
}
