// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rent_ro/controller/location/location_provider.dart';
import 'package:rent_ro/controller/location/location_services.dart';

import 'package:rent_ro/utiles/colors.dart';
import 'package:rent_ro/view/widgets/common_app_bar.dart';
import 'package:shimmer/shimmer.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resHeight = MediaQuery.of(context).size.width;
    final pro = Provider.of<LocationProvider>(context);
    return Scaffold(
      backgroundColor: CommonColors.kBlack,
      appBar: PreferredSize(
          preferredSize: Size(resHeight, resHeight),
          child: CommonAppBar(
            resHeight: resHeight,
            title: pro.locationNameController.text.isEmpty
                ? "locations"
                : pro.locationNameController.text,
            context: context,
          )),
      body: Padding(
        padding: EdgeInsets.all(resHeight * 0.05),
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: Provider.of<LocationProvider>(context)
                        .locationsResponse
                        .isNotEmpty
                    ? Provider.of<LocationProvider>(context).id.length - 1
                    : 12,
                itemBuilder: (BuildContext context, int index) {
                  return Consumer<LocationProvider>(
                    builder: (context, value, child) {
                      LocationServices().getLocations(context);
                      return value.locationsResponse.isNotEmpty
                          ? GridTile(
                              footer: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: CommonColors.kGrey,
                                    width: resHeight * 0.005,
                                  ),
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.circular(resHeight * 0.03),
                                ),
                                child: Center(
                                  child: Text(
                                    value.locationNames[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  value.setLocation(
                                    locationId: value.locationID[index],
                                    locationName: value.locationNames[index],
                                    context: context,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          value.locationImage[index],
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                            )
                          : Shimmer.fromColors(
                              baseColor:
                                  const Color.fromARGB(255, 133, 129, 129),
                              highlightColor:
                                  const Color.fromRGBO(186, 182, 182, 1),
                              child: GridTile(
                                footer: Container(
                                  height: resHeight * 0.35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: CommonColors.kGrey,
                                      width: resHeight * 0.005,
                                    ),
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.circular(resHeight * 0.03),
                                  ),
                                  child: const Center(),
                                ),
                                child: const SizedBox(),
                              ),
                            );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List items = ["hello", "world", "world"];
}

/*
 return Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 133, 129, 129),
              highlightColor: Color.fromARGB(255, 186, 182, 182),
              child: Padding(
                padding: EdgeInsets.all(resHeight * 0.05),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: 12,
                        itemBuilder: (BuildContext context, int index) {
                          return GridTile(
                            footer: Container(
                              height: resHeight * 0.35,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: CommonColors.kGrey,
                                  width: resHeight * 0.005,
                                ),
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.circular(resHeight * 0.03),
                              ),
                              child: const Center(),
                            ),
                            child: const SizedBox(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );

*/

/*
return Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 133, 129, 129)
                          .withOpacity(0.3),
                      highlightColor: const Color.fromARGB(255, 186, 182, 182),
                      child: Padding(
                        padding: EdgeInsets.only(top: resHeight * 0.05),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.8,
                                  crossAxisSpacing: 15.0,
                                  mainAxisSpacing: 15.0,
                                ),
                                itemCount: 12,
                                itemBuilder: (BuildContext context, int index) {
                                  return GridTile(
                                    footer: Container(
                                      height: resHeight * 0.35,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: CommonColors.kGrey,
                                          width: resHeight * 0.005,
                                        ),
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(
                                            resHeight * 0.03),
                                      ),
                                      child: const Center(),
                                    ),
                                    child: const SizedBox(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );

*/