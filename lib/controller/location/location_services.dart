import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rent_ro/controller/exceptions/common_dio_erorr.dart';
import 'package:rent_ro/controller/services/api_urls.dart';
import 'package:rent_ro/model/location_model.dart';
import 'package:rent_ro/view/widgets/dialoge_messages.dart';

class LocationServices {
  final Dio dio = Dio();
  Future<List<LocationModel>> getLocations(context) async {
    Response response = await dio.get(ApiUrls.baseUrl + ApiUrls.setup);
    try {
      if (response.statusCode == 201) {
        List<LocationModel> locatiomModel = [];
        LocationModel mapJson = LocationModel.fromJson(response.data);
        locatiomModel.add(mapJson);
        return locatiomModel;
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
