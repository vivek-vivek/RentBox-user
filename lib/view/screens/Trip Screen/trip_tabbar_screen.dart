import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/controller/Trip%20Detiles/trip_provider.dart';
import 'package:rent_ro/controller/signup/signup_provider.dart';
import 'package:rent_ro/utiles/colors.dart';
import 'package:rent_ro/view/screens/order/order_details_screen.dart';
import 'package:rent_ro/view/screens/product/product_screen.dart';
import 'package:rent_ro/view/screens/search/result_screen.dart';

class TripTabbarScreen extends StatelessWidget {
  const TripTabbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Bookings"),
          backgroundColor: CommonColors.kBlack,
          bottom: const TabBar(
            tabs: [
              Tab(text: "My Bookings"),
              Tab(text: 'Upcomming Bookings'),
              Tab(text: 'Exparing Bookings'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [MYOrders(), UpCommingBookings(), ExpairingBookings()],
        ),
      ),
    );
  }
}

class MYOrders extends StatelessWidget {
  const MYOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ExpairingBookings extends StatelessWidget {
  const ExpairingBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class UpCommingBookings extends StatelessWidget {
  const UpCommingBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<TripProvider>(context, listen: false).getMyOrders(context);

    final rsize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<TripProvider>(builder: (context, value, child) {
        log(value.photos.length.toString());
        return ListView.separated(
          shrinkWrap: true,
          itemCount: value.response.isNotEmpty ? value.carId.length : 6,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: rsize.height * 0.05,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  top: rsize.width * 0.03,
                  left: rsize.width * 0.05,
                  right: rsize.width * 0.05),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 23, 24, 24),
                    borderRadius: BorderRadius.all(Radius.circular(
                      rsize.width * 0.03,
                    ))),
                child: value.response.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         OrderDetailesScreen(index: index),
                          //   ),
                          // );
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: rsize.height * 0.22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(rsize.width * 0.03),
                                        topRight: Radius.circular(
                                            rsize.width * 0.03)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            value.photos[index][0]),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: rsize.width * 0.41),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: rsize.width * 0.03),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: rsize.width * 1,
                                      child: Text(
                                        value.carName[index].toString(),
                                        style: GoogleFonts.truculenta(
                                            color: CommonColors.kWhite,
                                            fontWeight: FontWeight.bold,
                                            fontSize: rsize.width * 0.075),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          DateFormat("dd MMM yyyy")
                                              .format(value.bookedDates[index]),
                                          style: GoogleFonts.truculenta(
                                              color: CommonColors.kWhite,
                                              fontWeight: FontWeight.w300,
                                              fontSize: rsize.width * 0.055),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                        color: CommonColors.kGrey,
                                        thickness: 1.5),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        value.name[index].toString(),
                                        style: GoogleFonts.truculenta(
                                          color: CommonColors.kWhite,
                                          fontWeight: FontWeight.w300,
                                          fontSize: rsize.width * 0.055,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: rsize.width * 0.04),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductScreen(index: index),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: CommonColors.red,
                                    size: rsize.width * 0.1,
                                  )),
                            )
                          ],
                        ),
                      )
                    : ResultShimmer(
                        resHeight: rsize,
                      ),
              ),
            );
          },
        );
      }),
    );
  }
}


/*

Padding(
              padding: EdgeInsets.only(
                  top: rsize.width * 0.03,
                  left: rsize.width * 0.05,
                  right: rsize.width * 0.05),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 23, 24, 24),
                    borderRadius: BorderRadius.all(Radius.circular(
                      rsize.width * 0.03,
                    ))),
                child: value.response.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  OrderDetailesScreen(index: index),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: rsize.height * 0.22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(rsize.width * 0.03),
                                        topRight: Radius.circular(
                                            rsize.width * 0.03)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            value.photos[index].first),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: rsize.width * 0.41),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: rsize.width * 0.03),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: rsize.width * 1,
                                      child: Text(
                                        value.carName.toString(),
                                        style: GoogleFonts.truculenta(
                                            color: CommonColors.kWhite,
                                            fontWeight: FontWeight.bold,
                                            fontSize: rsize.width * 0.075),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Text(
                                      value.fuelType.toString(),
                                      style: GoogleFonts.truculenta(
                                          color: CommonColors.kWhite,
                                          fontWeight: FontWeight.w300,
                                          fontSize: rsize.width * 0.055),
                                      textAlign: TextAlign.start,
                                    ),
                                    const Divider(
                                        color: CommonColors.kGrey,
                                        thickness: 1.5),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Indin Rupees ${value.price.toString()}/hour",
                                        style: GoogleFonts.truculenta(
                                          color: CommonColors.kWhite,
                                          fontWeight: FontWeight.w300,
                                          fontSize: rsize.width * 0.055,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: rsize.width * 0.04),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductScreen(index: index),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: CommonColors.red,
                                    size: rsize.width * 0.1,
                                  )),
                            )
                          ],
                        ),
                      )
                    : ResultShimmer(
                        resHeight: rsize,
                      ),
              ),
            );*/