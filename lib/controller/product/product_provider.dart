import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/controller/location/location_provider.dart';
import 'package:rent_ro/controller/product/product_services.dart';
import 'package:rent_ro/model/single_car_model.dart';

class ProductProvider with ChangeNotifier {
  List<SingleCarModel> model = [];

  List<SingleCar> carData = [];
  dynamic carID;

  List<AvailableLocation> availableLocation = [];

  List<PickupPoint> pickupPoints = [];

  List<dynamic> pointNames = [];
  List<Coords> coords = [];

  List<dynamic> lat = [];
  List<dynamic> lng = [];

  String? carId;
  String? pickupPlace;
  String? pickdate;
  String? dropeDate;
  String? pickupTime;
  String? dropOffTime;
  String? pickup;
  int? price;

  /*----------------------Singel Product Data -------------*/
  getSingleProduct({required index, required context}) async {
    try {
      //CLEAR LIST
      model.clear();
      carData.clear();
      availableLocation.clear();
      pickupPoints.clear();
      pointNames.clear();
      coords.clear();
      lat.clear();
      lng.clear();

      // GET single product respose
      model = await ProductService()
          .getSingleProductResponse(index: index, context: context);
      notifyListeners();

      // SEt data from location provider
      final provider = Provider.of<LocationProvider>(context, listen: false);
      pickdate = provider.startDateController.text;
      dropeDate = provider.endDateController.text;
      pickupTime = provider.startTimeController.text;
      dropOffTime = provider.endTimeController.text;

      for (var element in model) {
        carData.add(element.car);
        notifyListeners();
      }

      for (var element in carData) {
        carId = element.id;
        pickupPlace = element.pickupPoints.first;

        availableLocation.add(element.availableLocation);
        notifyListeners();
      }
      log(pickupPoints.toString());
      for (var element in availableLocation) {
        pickupPoints.addAll(element.pickupPoints);
        notifyListeners();
      }
      log(pickupPoints.toString());
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
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

/*---------------------Price -------------------------*/
  void setPrice({required priceCome}) {
    price = priceCome;
    notifyListeners();
  }
}
