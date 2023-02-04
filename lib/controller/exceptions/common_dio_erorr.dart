import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rent_ro/view/widgets/dialoge_messages.dart';

/*
* The following is the default implementation of the eror handling function
* in catch block

  * if (error is DioError) {
  *       handleDioError(context, error);
  *    } else {
  *      handleException(context, error);
  *    }

*/

void handleDioError(BuildContext context, DioError error) {
  ScaffoldMessenger.of(context).showSnackBar(
    DialogeMessages()
        .commonSnackBar(text: "Server Down ...\n ${error.message.toString()}"),
  );
}

void handleException(BuildContext context, dynamic exception) {
  ScaffoldMessenger.of(context).showSnackBar(
    DialogeMessages().commonSnackBar(text: exception.message.toString()),
  );
}
