// ignore_for_file: must_be_immutable, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/controller/map_user/map_user_provider.dart';
import 'package:rent_ro/controller/payment/payment_provider.dart';
import 'package:rent_ro/controller/search/search_provider.dart';
import 'package:rent_ro/utiles/colors.dart';
import 'package:rent_ro/view/screens/map_user/map_screen.dart';
import 'package:rent_ro/view/widgets/common_app_bar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final rSize = MediaQuery.of(context).size;
    final pay = Provider.of<PaymentProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: CommonColors.kBlack,
      appBar: PreferredSize(
        preferredSize: Size(rSize.width, rSize.width),
        child: CommonAppBar(
          resHeight: rSize.width,
          context: context,
          title: 'Payment',
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
                          SizedBox(height: rSize.width * 0.08),
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
                              Form(
                                key: _formKey,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: rSize.width * 0.55,
                                      child: TextFormField(
                                        controller:
                                            Provider.of<MapUserProvider>(
                                                    context)
                                                .pickupPointCtrl,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "  Select a pick points",
                                          hintStyle: GoogleFonts.truculenta(
                                            color: Colors.white,
                                            fontSize: rSize.width * 0.04,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Select pickup and return point';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MapScreen(index: index)));
                                      },
                                      icon: const Icon(
                                        Icons.gps_fixed_sharp,
                                        color: CommonColors.kWhite,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: rSize.width * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                "${Provider.of<Searchprovider>(context).rentPeriod}/hour",
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
                                "Total Amount",
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
                                    if (_formKey.currentState!.validate()) {
                                      pay.openRazorpay(
                                          context: context, index: index);
                                    }
                                  },
                                  child: Text(
                                    "PAY NOW",
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
