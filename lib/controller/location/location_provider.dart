import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/controller/location/location_services.dart';
import 'package:rent_ro/controller/search/search_provider.dart';
import 'package:rent_ro/model/location_model.dart';
import 'package:rent_ro/view/widgets/dialoge_messages.dart';

class LocationProvider with ChangeNotifier {
  List<PickupPoint> locationPickupPoints = [];
  List<dynamic> locationID = [];
  List<dynamic> locationImage = [];
  List<dynamic> locationNames = [];

  /// child of locationPickupPoints
  List<Coords> coords = [];
  List<dynamic> pickupName = [];
  List<dynamic> id = [];

  ///  child of coords
  List<dynamic> lat = [];
  List<dynamic> lng = [];

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  TextEditingController locationNameController = TextEditingController();
  TextEditingController locationIdController = TextEditingController();
  bool isCalled = false;

  setCallback() {
    isCalled = true;
    notifyListeners();
    return;
  }

  List<LocationModel> locationsResponse = [];
  List<Location> locationDetailes = [];
  // Function --> ( 1 )
  /// Response from the server(http://localhost:5001)
  getLocationResponse(context) async {
    // Response from  class HomeServise -location

    locationsResponse.clear();

    locationsResponse = await LocationServices().getLocations(context);

    notifyListeners();
    // Response of Locations setting data into
    // locatonMap  map

    if (locationsResponse.isNotEmpty) {
      log('true');
      locationDetailes.clear();
      for (var element in locationsResponse) {
        locationDetailes.addAll(element.locations);
      }

      locationID.clear();
      locationImage.clear();
      locationNames.clear();
      locationPickupPoints.clear();
      coords.clear();
      pickupName.clear();
      id.clear();
      lat.clear();
      lng.clear();
      notifyListeners();
      for (var element in locationDetailes) {
        locationID.add(element.id);
        locationImage.add(element.image);
        locationNames.add(element.location);
        locationPickupPoints.addAll(element.pickupPoints);
        notifyListeners();
      }
      for (var element in locationPickupPoints) {
        id.add(element.id);
        pickupName.add(element.name);
        coords.add(element.coords);
        notifyListeners();
      }
      for (var element in coords) {
        lat.add(element.lat);
        lng.add(element.lng);
        notifyListeners();
      }

      notifyListeners();
    } else {
      log(" check out on ---> lib/controller/provider/location.dart---> ( 1 )");
    }

    notifyListeners();
  }

  /// validating search request elements
  validation(context) {
    if (startDateController.text.isEmpty &&
        endDateController.text.isEmpty &&
        locationNameController.text.isEmpty &&
        startTimeController.text.isEmpty &&
        endTimeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        DialogeMessages().commonSnackBar(
            text: 'Enter all details', bgColor: Colors.red.withRed(3)),
      );
      return;
    } else if (locationIdController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        DialogeMessages().commonSnackBar(
            text: 'Select a location', bgColor: Colors.red.withRed(3)),
      );
      return;
    } else if (startDateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(DialogeMessages()
          .commonSnackBar(
              text: 'Select starting date ', bgColor: Colors.red.withRed(3)));
      return;
    } else if (endDateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(DialogeMessages()
          .commonSnackBar(
              text: 'Select end date', bgColor: Colors.red.withRed(3)));
      return;
    } else if (startTimeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(DialogeMessages()
          .commonSnackBar(
              text: 'Select a location', bgColor: Colors.red.withRed(3)));
      return;
    } else if (endTimeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(DialogeMessages()
          .commonSnackBar(
              text: 'Select ending time', bgColor: Colors.red.withRed(3)));
      return;
    } else {
      Provider.of<Searchprovider>(context, listen: false)
          .getAllSearchResults(context);

      return;
    }
  }

  ///  Function ---> ( 2 )
  /// set loaction into location controller
  setLocation({locationName, locationId, context}) {
    locationNameController.text = locationName;
    locationIdController.text = locationId;
    Navigator.of(context).pop();
    notifyListeners();

    return;
  }

  setEndDate(endDate) {
    endDateController.text = endDate;
    log(endDateController.text);
    notifyListeners();
    return;
  }

  setStartDate(startDate) {
    startDateController.text = startDate;
    notifyListeners();
    return;
  }

  setEndTime(endDate) {
    endTimeController.text = endDate;
    notifyListeners();
    return;
  }

  setStartTime(startDate) {
    startTimeController.text = startDate;
    notifyListeners();
    return;
  }
}
