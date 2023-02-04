import 'dart:io';

import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import 'package:rent_ro/controller/exceptions/internet_conection.dart';
import 'package:rent_ro/controller/search/search_provider.dart';
import 'package:rent_ro/controller/services/api_urls.dart';
import 'package:rent_ro/model/single_car_model.dart';

class ProductService {
  getSingleProductResponse({required index, context}) async {
    final Dio dio = Dio();

    Response response = await dio.get(
        "${ApiUrls.baseUrl}/car/${Provider.of<Searchprovider>(context, listen: false).id[index]}");
    try {
      if (response.statusCode == 201) {
        List<SingleCarModel> singleCarModel = [];
        SingleCarModel mapJson = SingleCarModel.fromJson(response.data);
        singleCarModel.add(mapJson);
        return singleCarModel;
      }
    } catch (rrorr) {
      if (rrorr == SocketException) {
        internetConncetionCheck(context);
      }
    }
    return [];
  }
}
