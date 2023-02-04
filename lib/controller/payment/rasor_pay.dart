import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rent_ro/view/screens/payment/summery_screen.dart';

class RasorPay {
  void handlePaymentErrorResponse(PaymentFailureResponse response, context) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */

    log("Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
    showAlertDialog(context, "Payment Failed",
        "Your payment was unsuccessful. Please try again or contact support for assistance.");
  }

  void handlePaymentSuccessResponse(
      PaymentSuccessResponse response, context, index) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    log("handlePaymentSuccessResponse");
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            PaymentSummery(index: index, response: response)));
  }

  void handleExternalWalletSelected(ExternalWalletResponse response, context) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: continueButton,
        ),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
