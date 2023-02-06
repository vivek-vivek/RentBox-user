import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:rent_ro/view/widgets/dialoge_messages.dart';

class MapUserProvider with ChangeNotifier {
  TextEditingController pickupPointCtrl = TextEditingController();
  String? lat;
  String? lng;
  String? carId;
  String? placeId;

  validation(context) {
    if (pickupPointCtrl.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(DialogeMessages()
          .commonSnackBar(
              text: 'Select end date', bgColor: Colors.red.withRed(3)));
    } else {}
  }

  setCtrlValue({text, lat, lng, id, obj}) {
    pickupPointCtrl.text = text;
    lat = lat;
    lng = lng;
    carId = id;
    placeId = obj;
    log(placeId.toString());
    notifyListeners();
  }

  // order()async{
  // Response response = await Dio()
  //         .post(ApiUrls.baseUrl + ApiUrls.auth + ApiUrls.loginMobile, data: {
  //       "mobile": ,
  //       "password": password,
  //     });

  // }
}
