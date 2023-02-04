import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/controller/exceptions/internet_conection.dart';
import 'package:rent_ro/controller/location/location_provider.dart';
import 'package:rent_ro/controller/services/api_urls.dart';
import 'package:rent_ro/controller/services/search_services.dart';
import 'package:rent_ro/model/search_model.dart';
import 'package:rent_ro/model/single_car_model.dart';
import 'package:rent_ro/view/screens/search/result_screen.dart';

class Searchprovider with ChangeNotifier {
  /// Car Details array's
  List<dynamic> id = [];
  List<dynamic> seatNum = [];
  List<dynamic> location = [];
  List<dynamic> name = [];
  List<dynamic> price = [];
  List<List<dynamic>> phots = [];
  List<dynamic> vendor = [];

  List<dynamic> fuelType = [];
  List<dynamic> gearType = [];

  ///  Time Details Array's
  dynamic pickUpDate;
  dynamic dropOfDate;
  dynamic pickUpTime;
  dynamic dropOfTime;
  dynamic rentPeriod;

  List<Car> cars = [];
  List<Time> time = [];

  /// Response from THE API's
  List<SearchModel> response = [];

  Future getAllSearchResults(context) async {
    internetConncetionCheck(context);
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);

    try {
      response.clear();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ResultScreen()));
      response = (await SearchService().fetchCars(
          locationId: locationProvider.locationIdController.text,
          pickupDate: locationProvider.startDateController.text,
          pickupTime: locationProvider.startTimeController.text,
          dropOffTime: locationProvider.endTimeController.text,
          dropOffDate: locationProvider.endDateController.text,
          context: context));
      notifyListeners();
      if (response.isNotEmpty) {
        // set values into  model class arrays
        cars.clear();
        time.clear();
        for (var element in response) {
          cars.addAll(element.cars);
          time.add(element.time);
          notifyListeners();
        }

        /// Seting caars deatils into arrays
        id.clear();
        seatNum.clear();
        location.clear();
        name.clear();
        price.clear();
        phots.clear();
        vendor.clear();
        fuelType.clear();
        gearType.clear();
        for (var element in cars) {
          id.add(element.id);
          seatNum.add(element.seatNum);
          location.add(element.location);
          name.add(element.name);
          price.add(element.price);
          phots.add(element.photos);
          vendor.add(element.vendor);
          fuelType.add(element.fuelType);
          gearType.add(element.gearType);
          notifyListeners();
        }

        // SETING times InTo array's
        for (var element in time) {
          pickUpDate = element.pickupDate;
          pickUpTime = element.pickupTime;
          dropOfDate = element.dropOffDate;
          dropOfTime = element.dropOffTime;
          rentPeriod = element.rentPeriod;
          notifyListeners();
        }
        notifyListeners();
      }
      notifyListeners();
    } catch (rorr) {
      log(rorr.toString());
      log(rorr.hashCode.toString());
    } finally {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ResultScreen(),
        ),
      );
    }
  }
}
