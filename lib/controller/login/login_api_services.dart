import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_ro/controller/services/api_urls.dart';
import 'package:rent_ro/view/screens/my_app_screen.dart';
import 'package:rent_ro/view/widgets/dialoge_messages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiServices {
  Future loginApiServices({mobile, password, context}) async {
    try {
      log("$mobile  :  $password ");

      Response response = await Dio()
          .post(ApiUrls.baseUrl + ApiUrls.auth + ApiUrls.loginMobile, data: {
        "mobile": mobile,
        "password": password,
      });

      //.timeout(const Duration(seconds: 120))

      // LOGIN coplete
      if (response.statusCode == 201) {
        // SHARED PRIFERENCE OBJECT
        final prefs = await SharedPreferences.getInstance();

        // ACCESS TOKEN
        String ACCESS_TOKEN = response.data['accessToken'];
        prefs.setString('ACCESS_TOKEN', ACCESS_TOKEN);

        // LOGIN OR NOT
        prefs.setBool('isLoggedIn', true);

        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MyAppScreen(),
        ));
      } else if (response.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
            DialogeMessages().commonSnackBar(text: 'user note found!'));
        return;
      } else {
        return ScaffoldMessenger.of(context).showSnackBar(DialogeMessages()
            .commonSnackBar(
                text:
                    'User Not Found With This Information ,Try to signup again'));
      }
    } on TimeoutException {
      ScaffoldMessenger.of(context).showSnackBar(
          DialogeMessages().commonSnackBar(text: 'time outed request'));
    } on SocketException {
      ScaffoldMessenger.of(context).showSnackBar(DialogeMessages()
          .commonSnackBar(text: 'OOPS!!! No Internet Conection !'));
    } catch (error) {
      if (error is DioError) {
        handleDioError(context, error);
      } else {
        log(error.toString());
      }
    }
  }

  void handleDioError(BuildContext context, DioError error) {
    ScaffoldMessenger.of(context).showSnackBar(
      DialogeMessages().commonSnackBar(
          text: "Server Down ...\n ${error.message.toString()}"),
    );
  }

  // void handleException(BuildContext context, dynamic exception) {
  //  if (exception.toString()=="") {

  //  }
  // }
}

Future<dynamic> dialogs(
    {String title = '', String content = '', required context}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: GoogleFonts.anybody(fontSize: 20),
        ),
        content: Text(
          content,
          style: GoogleFonts.anybody(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("back"),
          )
        ],
      );
    },
  );
}

/*
on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        ScaffoldMessenger.of(contexts).showSnackBar(
          DialogeMessages().commonSnackBar(text: 'Incorect Informations !!!'),
        );
      }

      if (e.response == null) {
        ScaffoldMessenger.of(contexts).showSnackBar(
          DialogeMessages()
              .commonSnackBar(text: 'OOPS!!! Something Went Wrong !'),
        );
      }
    }
*/
