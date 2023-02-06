import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rent_ro/controller/services/api_urls.dart';
import 'package:rent_ro/view/screens/my_app_screen.dart';
import 'package:rent_ro/view/widgets/dialoge_messages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpApiServices {
  /// OtpApiServices
  /// Use Dio to post the data to the API.
  /// get the mobile number from the textformfield and make and verify
  Future otpApiServices({
    required mobile,
    required otp,
    required context,
  }) async {
    try {
      // POST - DATA FOR OTP
      var json = jsonEncode({'mobile': mobile, 'otp': otp});
      var response = await Dio().post(
          ApiUrls.baseUrl + ApiUrls.auth + ApiUrls.otpVerify,
          data: json,
          options: Options(contentType: "application/json"));

      if (response.statusCode == 201) {
        // SHARED PRIFERENCE OBJECT
        final prefs = await SharedPreferences.getInstance();

        // ACCESS TOKEN
        String accessToken = response.data['accessToken'];
        prefs.setString('access_token', accessToken);

        // LOGIN OR NOT
        prefs.setBool('isLoggedIn', true);

        //  LOG OUT
        //final prefs = await SharedPreferences.getInstance();
        // prefs.remove("isLoggedIn");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MyAppScreen()));
      } else if (response.statusCode == 400) {
        //error message => Otp Is Incorrect
        ScaffoldMessenger.of(context).showSnackBar(
          DialogeMessages().commonSnackBar(text: 'OOPS!!! Otp Is Incorrect !'),
        );
      }
    } on SocketException {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        DialogeMessages()
            .commonSnackBar(text: 'OOPS!!! No Internet Conection !'),
      );

      //Handling timeout error---------->
    } on DioError catch (e) {
      if (e.response == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          DialogeMessages()
              .commonSnackBar(text: 'OOPS!!! Something Went Wrong !'),
        );
        Navigator.of(context).pop();
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
