import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rent_ro/controller/Trip%20Detiles/trip_services.dart';
import 'package:rent_ro/model/order_model.dart';

class TripProvider extends ChangeNotifier {
  /*------------------------------RESPONSE------------------------------------*/
  List<OrderModel> response = [];

  /*---------------------------API RESPONSE DATA-------------------------------*/

  List<dynamic> myOrders = [];
  List<UpComingPickup> upCommingPickups = [];
  List<dynamic> upCommingBookings = [];

  /*----------------------------UPCOMMING CARS DATA----------------------------*/

  List<String> id = [];
  List<String> pickupDate = [];
  List<String> pickupTime = [];
  List<String> dropOffDate = [];
  List<String> dropOffTime = [];
  List<String> carId = [];
  List<String> userId = [];
  List<int> price = [];
  List<bool> pickupStatus = [];
  List<bool> dropOffStatus = [];

  List<Pickup> pickup = [];
  List<CarData> carData = [];

  /*----------------------------PICKUP DATA------------------------------------*/

  List<String> name = [];
  List<String> pickupId = [];
  List<Coords> coords = [];

  /*--------------------------------COORDS------------------------------------*/

  List<double> lat = [];
  List<double> lng = [];

  /*------------------------------CAR DATA--------------------------------------*/

  List<String> newCarId = [];
  List<String> gearType = [];
  List<String> fuelType = [];
  List<int> seatNum = [];
  List<String> location = [];
  List<String> vendor = [];
  List<String> carName = [];
  List<int> totalPrice = [];
  List<int> rcNumber = [];

  List<dynamic> bookedTime = [];
  List<DateTime> bookedDates = [];
  List<dynamic> photos = [];
  List<String> pickupPoints = [];

  getMyOrders(context) async {
    log("fetch order");
    response.clear();
    upCommingPickups.clear();
    upCommingBookings.clear();
    pickup.clear();
    carData.clear();
    coords.clear();
    bookedTime.clear();
    bookedDates.clear();
    photos.clear();
    pickupPoints.clear();

    response = await TripServices().getResponse(context);
    notifyListeners();
    for (var element in response) {
      log('1');
      upCommingPickups.addAll(element.upComingPickups);
      notifyListeners();
    }

    // UPCOMMING PICKUPS
    for (var element in upCommingPickups) {
      id.add(element.id);
      pickupDate.add(element.pickupDate);
      pickupTime.add(element.pickupTime);
      dropOffDate.add(element.dropOffDate);
      dropOffTime.add(element.dropOffTime);
      carId.add(element.carId);
      userId.add(element.userId);
      price.add(element.price);
      pickupStatus.add(element.pickupStatus);
      dropOffStatus.add(element.dropOffStatus);

      pickup.add(element.pickup);
      carData.add(element.carData);

      notifyListeners();
    }

    // PICKUP
    for (var element in pickup) {
      name.add(element.name);
      id.add(element.id);

      coords.add(element.coords);

      notifyListeners();
    }

    // COORDS
    for (var element in coords) {
      lat.add(element.lat);
      lng.add(element.lng);
      notifyListeners();
    }

    // CAR DATA

    for (var element in carData) {
      newCarId.add(element.id);
      gearType.add(element.gearType);
      fuelType.add(element.fuelType);
      seatNum.add(element.seatNum);
      location.add(element.location);
      vendor.add(element.vendor);
      carName.add(element.name);
      totalPrice.add(element.price);
      rcNumber.add(element.rcNumber);

      bookedTime.add(element.bookedTime);
      bookedDates.addAll(element.bookedDates);
      photos.add(element.photos);
      pickupPoints.addAll(element.pickupPoints);

      notifyListeners();
    }
    notifyListeners();
  }
}
