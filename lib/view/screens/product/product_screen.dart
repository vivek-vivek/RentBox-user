import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/controller/location/location_provider.dart';
import 'package:rent_ro/controller/map_user/map_user_provider.dart';
import 'package:rent_ro/controller/product/product_provider.dart';
import 'package:rent_ro/controller/search/search_provider.dart';
import 'package:rent_ro/utiles/colors.dart';
import 'package:rent_ro/view/screens/map_user/map_screen.dart';
import 'package:rent_ro/view/screens/payment/payment_screen.dart';
import 'package:rent_ro/view/widgets/common_app_bar.dart';
import 'package:shimmer/shimmer.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final rsize = MediaQuery.of(context).size;
    final productprv = Provider.of<ProductProvider>(context);
    final isLoading = productprv.model.isEmpty;
    return Scaffold(
      backgroundColor: CommonColors.kBlack,
      appBar: PreferredSize(
        preferredSize: Size(rsize.width, rsize.width),
        child: CommonAppBar(
          resHeight: rsize.width,
          context: context,
          title: Provider.of<Searchprovider>(context).name[index],
        ),
      ),
      body: Consumer<Searchprovider>(
        builder: (context, product, child) {
          return Padding(
            padding: EdgeInsets.all(rsize.width * 0.05),
            child: ListView(
              children: [
                CaroselImages(
                    rsize: rsize.width, index: index, product: product),
                isLoading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: simmerWidget(width: 1, height: 0.15),
                      )
                    : HeadingTexts(
                        title: product.name[index],
                        rsize: rsize,
                        color: CommonColors.kWhite),
                Divider(
                  height: rsize.width * 0.05,
                  color: CommonColors.kGrey,
                ),
                isLoading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: simmerWidget(width: 1, height: 0.125),
                      )
                    : SmallTexts(
                        title: 'Date',
                        rsize: rsize,
                        color: CommonColors.kGrey,
                      ),
                isLoading
                    ? Divider(
                        height: rsize.width * 0.05, color: CommonColors.kGrey)
                    : SizedBox(height: rsize.width * 0.02),
                Row(
                  children: [
                    isLoading
                        ? const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            child: simmerWidget(width: 0.15, height: 0.14),
                          )
                        : CommonRoundIcon(
                            rsize: rsize, icon: Icons.calendar_month_outlined),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        isLoading
                            ? const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 8.0),
                                child: simmerWidget(width: 0.6, height: 0.125),
                              )
                            : Text(
                                "     ${Provider.of<LocationProvider>(context).startDateController.text}   ${Provider.of<LocationProvider>(context).startTimeController.text}",
                                style: GoogleFonts.truculenta(
                                  color: Colors.white,
                                  fontSize: rsize.width * 0.04,
                                ),
                              ),
                        isLoading
                            ? const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 8.0),
                                child: simmerWidget(width: 0.6, height: 0.125),
                              )
                            : Text(
                                "     ${Provider.of<LocationProvider>(context).endDateController.text}   ${Provider.of<LocationProvider>(context).endTimeController.text}",
                                style: GoogleFonts.truculenta(
                                  color: Colors.white,
                                  fontSize: rsize.width * 0.04,
                                ),
                              )
                      ],
                    )
                  ],
                ),
                SizedBox(height: rsize.width * 0.02),
                Divider(
                  height: rsize.width * 0.05,
                  color: CommonColors.kWhite,
                ),
                isLoading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: simmerWidget(width: 1, height: 0.125),
                      )
                    : SmallTexts(
                        title: 'PickUp & Return',
                        rsize: rsize,
                        color: CommonColors.kGrey,
                      ),
                SizedBox(height: rsize.width * 0.02),
                Row(
                  children: [
                    isLoading
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: simmerWidget(width: 0.15, height: 0.145),
                          )
                        : CommonRoundIcon(
                            rsize: rsize, icon: Icons.location_on_outlined),
                    Padding(
                      padding: EdgeInsets.only(left: rsize.width * 0.04),
                      child: SizedBox(
                        width: rsize.width * 0.55,
                        child: isLoading
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: simmerWidget(width: 1, height: 0.125),
                              )
                            : TextFormField(
                                controller:
                                    Provider.of<MapUserProvider>(context)
                                        .pickupPointCtrl,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "  Select a pick points",
                                  hintStyle: GoogleFonts.truculenta(
                                    color: Colors.white,
                                    fontSize: rsize.width * 0.04,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    isLoading
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: simmerWidget(width: 0.14, height: 0.135),
                          )
                        : IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
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
                SizedBox(height: rsize.width * 0.02),
                Divider(height: rsize.width * 0.05, color: CommonColors.kWhite),
                isLoading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: simmerWidget(width: 1, height: 0.125),
                      )
                    : SmallTexts(
                        title: 'Security',
                        rsize: rsize,
                        color: CommonColors.kGrey,
                      ),
                SizedBox(height: rsize.width * 0.02),
                Row(
                  children: [
                    isLoading
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: simmerWidget(width: 0.15, height: 0.145),
                          )
                        : CommonRoundIcon(
                            rsize: rsize,
                            icon: Icons.health_and_safety_outlined),
                    Text(
                      "     Insurense available for the travellars",
                      style: GoogleFonts.truculenta(
                        color: Colors.white,
                        fontSize: rsize.width * 0.04,
                      ),
                    )
                  ],
                ),
                SizedBox(height: rsize.width * 0.02),
                Divider(height: rsize.width * 0.05, color: CommonColors.kWhite),
                SizedBox(height: rsize.width * 0.02),
                isLoading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: simmerWidget(width: 1, height: 0.125),
                      )
                    : Container(
                        height: rsize.width * 0.13,
                        decoration: BoxDecoration(
                          color: CommonColors.grey2,
                          borderRadius:
                              BorderRadius.circular(rsize.width * 0.05),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: rsize.width * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${Provider.of<Searchprovider>(context).price[index]}  ₹   X   ${Provider.of<Searchprovider>(context).rentPeriod} /hour",
                                style: GoogleFonts.truculenta(
                                  color: Colors.white,
                                  fontSize: rsize.width * 0.04,
                                ),
                              ),
                              Text(
                                "${Provider.of<Searchprovider>(context).price[index] * Provider.of<Searchprovider>(context).rentPeriod} ₹",
                                style: GoogleFonts.truculenta(
                                  color: CommonColors.green2,
                                  fontWeight: FontWeight.bold,
                                  fontSize: rsize.width * 0.06,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                SizedBox(height: rsize.width * 0.02),
                Divider(height: rsize.width * 0.05, color: CommonColors.kWhite),
                SmallTexts(
                  title: 'Car basics',
                  rsize: rsize,
                  color: CommonColors.kGrey,
                ),
                SizedBox(height: rsize.width * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        isLoading
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: simmerWidget(width: 0.15, height: 0.145),
                              )
                            : CommonRoundIcon(
                                rsize: rsize,
                                icon: Icons.airline_seat_recline_extra,
                              ),
                        SmallTexts(
                          title:
                              '${Provider.of<Searchprovider>(context).seatNum[index]} Seat',
                          rsize: rsize,
                          color: CommonColors.kWhite,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        isLoading
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: simmerWidget(width: 0.15, height: 0.145),
                              )
                            : CommonRoundIcon(
                                rsize: rsize,
                                icon: Icons.local_gas_station_outlined,
                              ),
                        SmallTexts(
                          title:
                              '${Provider.of<Searchprovider>(context).fuelType[index]}',
                          rsize: rsize,
                          color: CommonColors.kWhite,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        isLoading
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: simmerWidget(width: 0.15, height: 0.145),
                              )
                            : CommonRoundIcon(
                                rsize: rsize,
                                icon: Icons.settings,
                              ),
                        SmallTexts(
                          title:
                              '${Provider.of<Searchprovider>(context).gearType[index]} gear',
                          rsize: rsize,
                          color: CommonColors.kWhite,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: rsize.width * 0.02),
                Divider(height: rsize.width * 0.05, color: CommonColors.kWhite),
                SizedBox(height: rsize.width * 0.02),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: rsize.width * 0.025),
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: simmerWidget(width: 1, height: 0.125))
            : Container(
                height: rsize.width * 0.14,
                decoration: BoxDecoration(
                  color: CommonColors.red,
                  borderRadius: BorderRadius.circular(rsize.width * 0.04),
                ),
                child: Center(
                  child: Consumer<Searchprovider>(
                      builder: (context, product, child) {
                    return TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(
                              index: index,
                            ),
                          ),
                        );
                        // rasorpay.openRazorpay(context: context, index: index);
                      },
                      child: Text(
                        "Continue",
                        style: GoogleFonts.truculenta(
                          color: CommonColors.kWhite,
                          fontSize: rsize.width * 0.08,
                        ),
                      ),
                    );
                  }),
                ),
              ),
      ),
    );
  }
}

// => Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => PaymentScreen(index: index),
//               )),
class CommonRoundIcon extends StatelessWidget {
  const CommonRoundIcon({
    super.key,
    required this.rsize,
    required this.icon,
    this.radius = 0.075,
  });

  final Size rsize;
  final IconData icon;
  final radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: rsize.width * radius,
      backgroundColor: CommonColors.red,
      child: CircleAvatar(
        radius: rsize.width * 0.070,
        backgroundColor: CommonColors.kBlack,
        child: Icon(
          icon,
          color: Colors.white,
          size: rsize.width * 0.075,
        ),
      ),
    );
  }
}

class HeadingTexts extends StatelessWidget {
  const HeadingTexts({
    super.key,
    required this.title,
    required this.rsize,
    required this.color,
  });

  final String title;
  final Size rsize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.truculenta(
        color: color,
        fontSize: rsize.width * 0.1,
      ),
    );
  }
}

class SmallTexts extends StatelessWidget {
  const SmallTexts({
    super.key,
    required this.title,
    required this.rsize,
    required this.color,
  });

  final String title;
  final Size rsize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.truculenta(
        color: color,
        fontSize: rsize.width * 0.05,
      ),
    );
  }
}

//Consumer<Searchprovider>(
// builder: (context, product, child) =>
// ignore: must_be_immutable
class CaroselImages extends StatelessWidget {
  CaroselImages(
      {super.key,
      required this.rsize,
      required this.index,
      required this.product});

  final double rsize;
  int index;
  dynamic product;

  @override
  Widget build(BuildContext context) {
    return Provider.of<ProductProvider>(context).pointNames.isEmpty
        ? const simmerWidget(width: 01, height: 0.6)
        : SizedBox(
            width: rsize * 1,
            child: CarouselSlider(
              options: CarouselOptions(
                  height: rsize * 0.50,
                  autoPlay: true,
                  animateToClosest: true,
                  viewportFraction: 1,
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 2000)),
              items: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: BoxDecoration(
                    color: CommonColors.kBlack,
                    image: DecorationImage(
                      image: NetworkImage(
                        product.phots[index][0],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        product.phots[index][1],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        product.phots[index][2],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}

class simmerWidget extends StatelessWidget {
  const simmerWidget({super.key, required this.width, required this.height});
  final num width;
  final num height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 133, 129, 129),
      highlightColor: const Color.fromRGBO(186, 182, 182, 1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber,
        ),
        width: MediaQuery.of(context).size.width * width,
        height: MediaQuery.of(context).size.width * height,
      ),
    );
  }
}
