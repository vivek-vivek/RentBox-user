// import 'dart:developer';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:rent_ro/controller/services/api_urls.dart';
// import 'package:rent_ro/model/location_model.dart';
// import 'package:rent_ro/view/widgets/dialoge_messages.dart';

// class PortServices {
//   /// top pics
//   Future<List<TopPick>> topPicks(context) async {
//     try {
//       Response response = await Dio().get(ApiUrls.baseUrl);
//       if (response.statusCode == 201) {
//         List<SearchModel> searchModel = [];
//         SearchModel mapJson = SearchModel.fromJson(response.data);
//         searchModel.add(mapJson);
//       } else {
//         log("work ayila");
//       }
//     } on SocketException {
//       ScaffoldMessenger.of(context).showSnackBar(
//         DialogeMessages().commonSnackBar(text: 'OOPS!!! Check Your Network !'),
//       );
//       //Handling timeout error---------->
//     } on DioError catch (erorr) {
//       if (erorr.response?.statusCode == 400) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           DialogeMessages().commonSnackBar(text: 'Incorect Informations !!!'),
//         );
//       }

//       if (erorr.response == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           DialogeMessages()
//               .commonSnackBar(text: 'OOPS!!! server not responding'),
//         );
//       }
//     } catch (erorr) {
//       log(erorr.toString());
//     }
//     return [];

//     //! change the status  here
//   }

// //
// //-----------------------------------------------------------------

// // location information -
// // from server(http://localhost:5001)- base url
// }
