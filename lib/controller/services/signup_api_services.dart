// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:rent_ro/controller/exceptions/common_dio_erorr.dart';
import 'package:rent_ro/controller/services/api_urls.dart';
import 'package:rent_ro/view/screens/otp_screen.dart';
import 'package:rent_ro/view/widgets/dialoge_messages.dart';

class SignUpApiServices {
  /// SignUpApiServices
  /// Use Dio to post the data to the API.
  /// get values form the UI screen and make a new user
  /// if the user not alredy exisists.
  Future signUpApiServices(
      {required signupModel,
      required BuildContext context,
      required mobile}) async {
    try {
      log("otp send akum  eppo , waite cheyii ... eppo kittum");
      // This will genarate a response from the api
      final response = await Dio().post(
          ApiUrls.baseUrl + ApiUrls.auth + ApiUrls.signup,
          data: signupModel.toJson());
      // This will send the response to the UI screen
      // Printing the response from the above function

      log("otp  sendikkunu , nokinok");

      if (response.statusCode == 409) {
        log("message");
        ScaffoldMessenger.of(context).showSnackBar(
          DialogeMessages().commonSnackBar(text: 'user already exists'),
        );
        return;
      } else if (response.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          DialogeMessages().commonSnackBar(text: 'Server Down'),
        );
        return;
      } else if (response.statusCode == 503) {
        ScaffoldMessenger.of(context).showSnackBar(
          DialogeMessages()
              .commonSnackBar(text: 'Server Down,cant sent otp now'),
        );
        return;
      } else if (response.statusCode == 500) {
        ScaffoldMessenger.of(context).showSnackBar(
          DialogeMessages().commonSnackBar(text: 'Server Down'),
        );
        return;
      } else if (response.statusCode! == 201) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return OTPScreen(mobile: mobile);
            },
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          DialogeMessages().commonSnackBar(text: 'Something Went Rong'),
        );
        return;
      }
    } catch (error) {
      if (error is DioError) {
        handleDioError(context, error);
      } else {
        handleException(context, error);
      }
    }
  }
}
