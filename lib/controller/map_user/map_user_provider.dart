import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:rent_ro/view/widgets/dialoge_messages.dart';

class MapUserProvider with ChangeNotifier {
  TextEditingController pickupPointCtrl = TextEditingController();
  String? lat;
  String? lng;

  validation(context) {
    if (pickupPointCtrl.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(DialogeMessages()
          .commonSnackBar(
              text: 'Select end date', bgColor: Colors.red.withRed(3)));
    } else {}
  }

  setCtrlValue({text, lat, lng}) {
    pickupPointCtrl.text = text;
    lat = lat;
    lng = lng;
    notifyListeners();
  }
}
