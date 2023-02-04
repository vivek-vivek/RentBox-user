import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/controller/location/location_provider.dart';
import 'package:rent_ro/controller/product/product_provider.dart';
import 'package:rent_ro/controller/search/search_provider.dart';
import 'package:rent_ro/utiles/colors.dart';
import 'package:rent_ro/view/screens/product/product_screen.dart';
import 'package:shimmer/shimmer.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resHeight = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CommonColors.kBlack,
      appBar: PreferredSize(
        preferredSize: Size(resHeight.width, resHeight.width),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                left: resHeight.width * 0.015,
                right: resHeight.width * 0.015,
                top: resHeight.width * 0.04),
            child: Consumer<LocationProvider>(builder: (context, value, child) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CommonColors.green,
                    width: resHeight.width * 0.005,
                  ),
                  color: CommonColors.kWhite,
                  borderRadius: BorderRadius.circular(resHeight.width * 0.03),
                ),
                height: resHeight.width * 0.15,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: resHeight.width * 0.01),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: CommonColors.green,
                          size: resHeight.width * 0.06,
                        ),
                      ),
                      Container(
                        width: resHeight.width * 0.7,
                        decoration: BoxDecoration(
                            color: CommonColors.lightGrey,
                            borderRadius:
                                BorderRadius.circular(resHeight.width * 0.02)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              value.locationNameController.text,
                              style: GoogleFonts.truculenta(
                                  color: CommonColors.kBlack,
                                  fontSize: resHeight.width * 0.04),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "${value.startDateController.text} - ${value.endDateController.text}",
                              style: GoogleFonts.lato(
                                  letterSpacing: 1,
                                  wordSpacing: 1,
                                  color: CommonColors.kBlack,
                                  fontSize: resHeight.width * 0.030),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: Provider.of<Searchprovider>(context).response.isNotEmpty
            ? Provider.of<Searchprovider>(context).name.length
            : 4,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: resHeight.height * 0.05,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
                top: resHeight.width * 0.03,
                left: resHeight.width * 0.05,
                right: resHeight.width * 0.05),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 23, 24, 24),
                  borderRadius: BorderRadius.all(Radius.circular(
                    resHeight.width * 0.03,
                  ))),
              child: Provider.of<Searchprovider>(context).response.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        Provider.of<ProductProvider>(context, listen: false)
                            .getSingleProduct(index: index, context: context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(index: index),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: resHeight.height * 0.22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          resHeight.width * 0.03),
                                      topRight: Radius.circular(
                                          resHeight.width * 0.03)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          Provider.of<Searchprovider>(context)
                                              .phots[index]
                                              .first),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: resHeight.width * 0.41),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: resHeight.width * 0.03),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: resHeight.width * 1,
                                    child: Text(
                                      Provider.of<Searchprovider>(context)
                                          .name[index],
                                      style: GoogleFonts.truculenta(
                                          color: CommonColors.kWhite,
                                          fontWeight: FontWeight.bold,
                                          fontSize: resHeight.width * 0.075),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Text(
                                    Provider.of<Searchprovider>(context)
                                        .fuelType[index],
                                    style: GoogleFonts.truculenta(
                                        color: CommonColors.kWhite,
                                        fontWeight: FontWeight.w300,
                                        fontSize: resHeight.width * 0.055),
                                    textAlign: TextAlign.start,
                                  ),
                                  const Divider(
                                      color: CommonColors.kGrey,
                                      thickness: 1.5),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Indin Rupees ${Provider.of<Searchprovider>(context).price[index].toString()}/hour",
                                      style: GoogleFonts.truculenta(
                                        color: CommonColors.kWhite,
                                        fontWeight: FontWeight.w300,
                                        fontSize: resHeight.width * 0.055,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: resHeight.width * 0.04),
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
                                  size: resHeight.width * 0.1,
                                )),
                          )
                        ],
                      ),
                    )
                  : ResultShimmer(
                      resHeight: resHeight,
                    ),
            ),
          );
        },
      ),
    );
  }
}

class ResultShimmer extends StatelessWidget {
  const ResultShimmer({
    super.key,
    required this.resHeight,
  });

  final Size resHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 133, 129, 129),
          highlightColor: const Color.fromRGBO(186, 182, 182, 1),
          child: Container(
            height: resHeight.height * 0.22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(resHeight.width * 0.03),
                  topRight: Radius.circular(resHeight.width * 0.03)),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 97, 94, 94),
                  Color.fromARGB(255, 155, 150, 150),
                  Color.fromARGB(255, 255, 253, 253),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: resHeight.width * 0.05, width: resHeight.width * 0.4),
        Padding(
          padding: EdgeInsets.only(top: resHeight.width * 0.41),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: resHeight.width * 1,
                height: resHeight.width * 0.075,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: const Color.fromARGB(255, 80, 78, 78),
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                  height: resHeight.width * 0.04, width: resHeight.width * 0.4),
              SizedBox(
                height: resHeight.width * 0.055,
                child: Shimmer.fromColors(
                  baseColor: const Color.fromARGB(255, 177, 174, 174),
                  highlightColor: const Color.fromARGB(255, 148, 138, 138),
                  child: Container(
                    color: const Color.fromARGB(255, 190, 188, 188),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 226, 224, 224),
            highlightColor: const Color.fromARGB(255, 177, 175, 175),
            child: Icon(
              Icons.favorite,
              size: resHeight.width * 0.1,
            ),
          ),
        ),
      ],
    );
  }
}
