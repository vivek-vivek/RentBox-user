// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rent_ro/controller/exceptions/common_dio_erorr.dart';
import 'package:rent_ro/controller/services/api_urls.dart';
import 'package:rent_ro/model/order_model.dart';
import 'package:rent_ro/view/widgets/dialoge_messages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TripServices {
  final Dio dio = Dio();

  Future<List<OrderModel>> getResponse(context) async {
    // SHARED PRIFERENCE OBJECT
    final prefs = await SharedPreferences.getInstance();

    // ACCESS TOKEN
    final dynamic ACCESS_TOKEN = prefs.getString('ACCESS_TOKEN');

    if (ACCESS_TOKEN.isEmpty && ACCESS_TOKEN == null) {
      log("ACCESS TOKEN IS 'EMPTY'");
    } else {
      log("ACCESS TOKEN IS 'NOT' EMPTY");
      log(ACCESS_TOKEN);
    }
    dio.options.headers["Authorization"] = "Bearer $ACCESS_TOKEN";

    Response response = await dio.get(ApiUrls.baseUrl + ApiUrls.bookings);

    try {
      if (response.statusCode == 201) {
        List<OrderModel> orderModel = [];
        OrderModel mapJson = OrderModel.fromJson(response.data);
        orderModel.add(mapJson);
        return orderModel;
      }
    } catch (error) {
      commonException(context: context, error: error);
    }
    return [];
  }
}

commonException({error, context}) {
  if (error is DioError) {
    switch (error.type) {
      // ... rest of the switch case statements
      case DioErrorType.connectTimeout:
        ScaffoldMessenger.of(context).showSnackBar(
            DialogeMessages().commonSnackBar(text: 'Conecection Timeouted'));
        break;
      case DioErrorType.sendTimeout:
        ScaffoldMessenger.of(context).showSnackBar(
            DialogeMessages().commonSnackBar(text: 'Conecection send timeout'));
        break;
      case DioErrorType.receiveTimeout:
        ScaffoldMessenger.of(context).showSnackBar(DialogeMessages()
            .commonSnackBar(text: 'Conecection receive timeout'));
        break;
      case DioErrorType.response:
        ScaffoldMessenger.of(context).showSnackBar(
            DialogeMessages().commonSnackBar(text: 'No Response'));
        break;
      case DioErrorType.cancel:
        ScaffoldMessenger.of(context).showSnackBar(
            DialogeMessages().commonSnackBar(text: 'Request canceled'));
        break;
      case DioErrorType.other:
        ScaffoldMessenger.of(context).showSnackBar(
            DialogeMessages().commonSnackBar(text: 'some other error'));
        break;
    }
  } else if (error is TypeError) {
    ScaffoldMessenger.of(context).showSnackBar(
        DialogeMessages().commonSnackBar(text: 'some other error'));
    return;
  } else {
    handleException(context, error);
  }
}
