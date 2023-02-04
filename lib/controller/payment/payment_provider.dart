import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rent_ro/controller/payment/payment_services.dart';
import 'package:rent_ro/controller/search/search_provider.dart';

class PaymentProvider with ChangeNotifier {
  Future openRazorpay({index, required context}) async {
    Razorpay razorpay = Razorpay();
    var options = {
      'key': 'rzp_test_y5gvtRY9ZcI4Xg',
      'amount':
          "${(Provider.of<Searchprovider>(context, listen: false).price[index] * Provider.of<Searchprovider>(context, listen: false).rentPeriod) * 100}",
      // Provider.of<CartProvider>(context, listen: false).subTotal * 100,
      'name': 'RentBox.',
      'description':
          "${Provider.of<Searchprovider>(context, listen: false).name[index]}",
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '+918089246277', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
        (PaymentFailureResponse response) {
      PaymentServices().handlePaymentErrorResponse(response, context);
    });
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
        (PaymentSuccessResponse response) {
      PaymentServices().handlePaymentSuccessResponse(response, context, index);
    });
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
        (ExternalWalletResponse response) {
      PaymentServices().handleExternalWalletSelected(response, context);
    });
    razorpay.open(options);
  }
}
