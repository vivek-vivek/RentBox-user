import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/controller/product/product_services.dart';

import 'package:rent_ro/controller/search/search_provider.dart';
import 'package:rent_ro/model/single_car_model.dart';

class ProductProvider with ChangeNotifier {
  List<SingleCarModel> model = [];

  List<SingleCar> carData = [];

  List<AvailableLocation> availableLocation = [];

  List<PickupPoint> pickupPoints = [];

  List<dynamic> pointNames = [];
  List<Coords> coords = [];

  List<dynamic> lat = [];
  List<dynamic> lng = [];

  getSingleProduct({required index, required context}) async {
    try {
      model.clear();
      carData.clear();
      availableLocation.clear();
      pickupPoints.clear();
      pointNames.clear();
      coords.clear();
      lat.clear();
      lng.clear();

      model = await ProductService()
          .getSingleProductResponse(index: index, context: context);

      notifyListeners();

      for (var element in model) {
        carData.add(element.car);
        notifyListeners();
      }
      for (var element in carData) {
        availableLocation.add(element.availableLocation);
        notifyListeners();
      }
      for (var element in availableLocation) {
        pickupPoints.addAll(element.pickupPoints);
        notifyListeners();
      }
      for (var element in pickupPoints) {
        pointNames.add(element.name);
        coords.add(element.coords);
        notifyListeners();
      }
      for (var element in coords) {
        lat.add(element.lat);
        lng.add(element.lng);
        notifyListeners();
      }
      log(lat.toString());
      log(lng.toString());
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }
}
