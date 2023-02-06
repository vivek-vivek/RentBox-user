import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rent_ro/controller/location/location_provider.dart';
import 'package:rent_ro/controller/search/search_provider.dart';
import 'package:rent_ro/utiles/colors.dart';
import 'package:rent_ro/view/screens/home_screen.dart';
import 'package:rent_ro/view/screens/my_app_screen.dart';
import 'package:rent_ro/view/widgets/common_app_bar.dart';

class PaymentSummery extends StatelessWidget {
  const PaymentSummery({Key? key, required this.index, required this.response})
      : super(key: key);

  final int index;
  final PaymentSuccessResponse response;

  @override
  Widget build(BuildContext context) {
    final rSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CommonColors.kBlack,
      appBar: PreferredSize(
        preferredSize: Size(rSize.width, rSize.width),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                left: rSize.width * 0.04,
                right: rSize.width * 0.04,
                top: rSize.width * 0.06),
            child: Container(
              decoration: BoxDecoration(
                color: CommonColors.kWhite,
                borderRadius: BorderRadius.circular(rSize.width * 0.03),
              ),
              height: rSize.width * 0.1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "    Payment Summery",
                    style: GoogleFonts.truculenta(
                        color: CommonColors.green,
                        fontSize: rSize.width * 0.05),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: rSize.width * 0.03,
                left: rSize.width * 0.05,
                right: rSize.width * 0.05),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 23, 24, 24),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    rSize.width * 0.03,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: rSize.height * 0.22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(rSize.width * 0.03),
                          topRight: Radius.circular(rSize.width * 0.03)),
                      image: DecorationImage(
                          image: NetworkImage(
                              Provider.of<Searchprovider>(context)
                                  .phots[index]
                                  .first),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: rSize.width * 0.05),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: rSize.width * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: rSize.width * 1,
                            child: Text(
                              Provider.of<Searchprovider>(context).name[index],
                              style: GoogleFonts.truculenta(
                                  color: CommonColors.kWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: rSize.width * 0.075),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Text(
                            Provider.of<Searchprovider>(context)
                                .fuelType[index],
                            style: GoogleFonts.truculenta(
                                color: CommonColors.kWhite,
                                fontWeight: FontWeight.w300,
                                fontSize: rSize.width * 0.055),
                            textAlign: TextAlign.start,
                          ),
                          const Divider(
                              color: CommonColors.kGrey, thickness: 1.5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pickup & Return Points",
                                style: GoogleFonts.truculenta(
                                    color: CommonColors.kWhite,
                                    fontWeight: FontWeight.w300,
                                    fontSize: rSize.width * 0.055),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                "* Manadhavadi Bus stand",
                                style: GoogleFonts.truculenta(
                                  color: CommonColors.lightGrey,
                                  fontWeight: FontWeight.w300,
                                  fontSize: rSize.width * 0.05,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: rSize.width * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Rent Period",
                                    style: GoogleFonts.truculenta(
                                        color: CommonColors.kWhite,
                                        fontWeight: FontWeight.w300,
                                        fontSize: rSize.width * 0.055),
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    "${Provider.of<LocationProvider>(context).endDateController.text}   ${Provider.of<LocationProvider>(context).endTimeController.text}",
                                    style: GoogleFonts.truculenta(
                                        color: CommonColors.kWhite,
                                        fontWeight: FontWeight.w300,
                                        fontSize: rSize.width * 0.04),
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    "${Provider.of<LocationProvider>(context).endDateController.text}   ${Provider.of<LocationProvider>(context).endTimeController.text}",
                                    style: GoogleFonts.truculenta(
                                        color: CommonColors.kWhite,
                                        fontWeight: FontWeight.w300,
                                        fontSize: rSize.width * 0.04),
                                    textAlign: TextAlign.start,
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: rSize.width * 0.05),
                                child: Text(
                                  "${Provider.of<Searchprovider>(context).rentPeriod}/hour",
                                  style: GoogleFonts.truculenta(
                                    color: CommonColors.kWhite,
                                    fontWeight: FontWeight.w300,
                                    fontSize: rSize.width * 0.055,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: rSize.width * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order ID",
                                style: GoogleFonts.truculenta(
                                  color: CommonColors.kWhite,
                                  fontWeight: FontWeight.w300,
                                  fontSize: rSize.width * 0.055,
                                ),
                              ),
                              Text(
                                response.orderId.toString(),
                                style: GoogleFonts.truculenta(
                                  color: CommonColors.kWhite,
                                  fontWeight: FontWeight.w300,
                                  fontSize: rSize.width * 0.055,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: rSize.width * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment ID",
                                style: GoogleFonts.truculenta(
                                  color: CommonColors.kWhite,
                                  fontWeight: FontWeight.w300,
                                  fontSize: rSize.width * 0.055,
                                ),
                              ),
                              Text(
                                response.paymentId.toString(),
                                style: GoogleFonts.truculenta(
                                  color: CommonColors.kWhite,
                                  fontWeight: FontWeight.w300,
                                  fontSize: rSize.width * 0.055,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: rSize.width * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment ID",
                                style: GoogleFonts.truculenta(
                                  color: CommonColors.kWhite,
                                  fontWeight: FontWeight.w300,
                                  fontSize: rSize.width * 0.055,
                                ),
                              ),
                              Text(
                                response.signature.toString(),
                                style: GoogleFonts.truculenta(
                                  color: CommonColors.kWhite,
                                  fontWeight: FontWeight.w300,
                                  fontSize: rSize.width * 0.055,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: rSize.width * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Amount Payid",
                                style: GoogleFonts.truculenta(
                                  color: CommonColors.kWhite,
                                  fontWeight: FontWeight.w300,
                                  fontSize: rSize.width * 0.055,
                                ),
                              ),
                              Text(
                                "${Provider.of<Searchprovider>(context).price[index] * Provider.of<Searchprovider>(context).rentPeriod}/INR",
                                style: GoogleFonts.truculenta(
                                  color: CommonColors.kWhite,
                                  fontWeight: FontWeight.w300,
                                  fontSize: rSize.width * 0.055,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: rSize.width * 0.04),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: rSize.width * 0.02),
                            child: Container(
                              height: rSize.width * 0.125,
                              decoration: BoxDecoration(
                                color: CommonColors.red,
                                borderRadius:
                                    BorderRadius.circular(rSize.width * 0.03),
                              ),
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyAppScreen()),
                                    );
                                  },
                                  child: Text(
                                    "Continue",
                                    style: GoogleFonts.truculenta(
                                      color: CommonColors.kWhite,
                                      fontSize: rSize.width * 0.08,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
