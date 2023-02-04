// import 'dart:developer';

// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rent_ro/controller/exceptions/internet_conection.dart';
import 'package:rent_ro/controller/services/api_urls.dart';
import 'package:rent_ro/model/location_model.dart';
import 'package:rent_ro/model/search_model.dart';

class SearchService {
  Future<List<SearchModel>> fetchCars(
      {required String locationId,
      required String pickupDate,
      required String dropOffDate,
      required String pickupTime,
      required String dropOffTime,
      context}) async {
    internetConncetionCheck(context);
    Response response = await Dio().get(
        "${ApiUrls.baseUrl}${ApiUrls.search}?locationId=$locationId&pickupDate=$pickupDate&dropOffDate=$dropOffDate&pickupTime=$pickupTime&dropOffTime=$dropOffTime");

    if (response.statusCode == 201) {
      List<SearchModel> searchModel = [];
      SearchModel mapJson = SearchModel.fromJson(response.data);
      searchModel.add(mapJson);
      return searchModel;
    } else {
      const CircularProgressIndicator();
    }
    return [];
  }

  Future<List<Location>> getLocations(context) async {
    final Dio dio = Dio();

    Response response = await dio.get("${ApiUrls.baseUrl} ${ApiUrls.setup}");
    try {
      if (response.statusCode == 201) {
        List<Location> locations = List<Location>.from(
            response.data["locations"].map((x) => Location.fromJson(x)));
        return locations;
      }
    } catch (rrorr) {
      if (rrorr == SocketException) {
        internetConncetionCheck(context);
      }
    }
    return [];
  }
}















//  "${ApiUrls.baseUrl}${ApiUrls.search}?locationId=$locationId&pickupDate=$pickupDate&dropOffDate=$dropOffDate&pickupTime=$pickupTime&dropOffTime=$dropOffTime");

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rent_ro/controller/provider/home_provider.dart';
// import 'package:rent_ro/controller/services/api_urls.dart';
// import 'package:rent_ro/model/search_model.dart';
// import 'package:rent_ro/view/screens/search_screen.dart';
// import 'package:rent_ro/view/widgets/dialoge_messages.dart';

// class SerchServices {
//   /// SerchServices
//   /// Use Dio to post the data to the API.
//   /// server(http://localhost:5001/search)

//   Future<void> postSerchServices(context) async {
//     log('2');
//     try {
//       SearchModel search = SearchModel(
//           location:
//               Provider.of<HomeProvider>(context, listen: false).locationId!,
//           pickupDate:
//               Provider.of<HomeProvider>(context, listen: false).startDate!,
//           dropOffDate:
//               Provider.of<HomeProvider>(context, listen: false).endDate!);
//       final response = await Dio()
//           .post(ApiUrls.baseUrl + ApiUrls.search, data: search.toJson());
//       if (response.statusCode == 201) {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => const SearchScreen(),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           DialogeMessages()
//               .commonSnackBar(text: response.statusCode.toString()),
//         );
//       }

//       log(response.data);
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
