// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rent_ro/controller/location/location_provider.dart';
import 'package:rent_ro/controller/map_user/map_user_provider.dart';
import 'package:rent_ro/controller/product/product_provider.dart';
import 'package:rent_ro/controller/search/search_provider.dart';
import 'package:rent_ro/controller/services/api_urls.dart';
import 'package:rent_ro/view/screens/payment/summery_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentServices {
/*-------------------------------ORDER SUCESS --------------------------------*/
  Future paymentDone(
      {required context,
      required index,
      required PaymentSuccessResponse responseresponse}) async {
    try {
      final providerMap = Provider.of<MapUserProvider>(context, listen: false);
      final providerLocation =
          Provider.of<LocationProvider>(context, listen: false);

      String dateString1 = providerLocation.startDateController.text;
      var date1 = DateFormat("yyyy/MMMM/d").parse(dateString1);
      var formatter1 = DateFormat('MMM d\'st\' yyyy');
      String formattedDate1 = formatter1.format(date1);
      String dateString2 = providerLocation.endDateController.text;
      var date2 = DateFormat("yyyy/MMMM/d").parse(dateString2);
      var formatter2 = DateFormat('MMM d\'st\' yyyy');
      String formattedDate2 = formatter2.format(date2);

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

      // SET DIO INSTANCE

      final dio = Dio(
        BaseOptions(
            connectTimeout: 30000,
            baseUrl: ApiUrls.baseUrl,
            responseType: ResponseType.json,
            contentType: ContentType.json.toString()),
      );
      dio.options.headers["Authorization"] = "Bearer $ACCESS_TOKEN";
      //  PASS ACCESS TOKEN INTO HEADER

      // dio.options.headers["Authorization"] = "Bearer $ACCESS_TOKEN";

      log(providerMap.carId.toString());
      log(Provider.of<ProductProvider>(context, listen: false)
          .price
          .toString());
      log(formattedDate1);
      log(formattedDate2);
      log(providerLocation.startTimeController.text);
      log(providerLocation.endTimeController.text);
      log(Provider.of<Searchprovider>(context, listen: false)
          .rentPeriod
          .toString());

      // POST - DATA FOR OTP
      var json = jsonEncode({
        "carId": '${providerMap.carId}',
        "payAmount": Provider.of<ProductProvider>(context, listen: false).price,
        "selectedPickup": '${providerMap.placeId}',
        "bookingTime": {
          "pickupDate": formattedDate1,
          "dropOffDate": formattedDate2,
          "pickupTime": providerLocation.startTimeController.text,
          "dropOffTime": providerLocation.endTimeController.text,
          "rentPeriod":
              Provider.of<Searchprovider>(context, listen: false).rentPeriod
        },
      });

/*------------------------HEADER IN DIO--------------------------*/
      // var headers = {
      //   'Authorization': 'Bearer $ACCESS_TOKEN',
      // };
      var response = await Dio().post("${ApiUrls.baseUrl}/payment/paymentDone",
          data: json,
          options: Options(
            headers: {"Authorization": "Bearer $ACCESS_TOKEN"},
          ));
      log(response.statusCode.toString());
      log(response.data.toString());
      if (response.statusCode == 201) {
        log("SUCCESSED");
        //  LOG OUT
        //final prefs = await SharedPreferences.getInstance();
        // prefs.remove("isLoggedIn");
        log("handlePaymentSuccessResponse");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                PaymentSummery(index: index, response: responseresponse)));
      }
    } on DioError catch (e) {
      log("----------------DIO ERORR-------------------");
      log("data : ${e.response?.data}");
      log("header : ${e.response?.headers}");
      log("ERORR TYPE : ${e.type} \nERORR : ${e.error}");
      log("$e");
    } catch (error) {
      log("-------------------CATCH ERORR---------------");
      log(error.toString());
    }
  }
}
