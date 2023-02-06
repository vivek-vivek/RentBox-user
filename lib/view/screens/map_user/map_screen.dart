import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/controller/product/product_provider.dart';
import 'package:rent_ro/controller/map_user/map_user_provider.dart';
import 'package:rent_ro/utiles/colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> controllers = Completer();

  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(10.1632, 76.6413),
    zoom: 14.4746,
  );

// on below line we have created the list of markers

// created method for getting user current product
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final resHeight = MediaQuery.of(context).size;
    final product = Provider.of<ProductProvider>(context);
    final mapUser = Provider.of<MapUserProvider>(context, listen: false);
    List<Marker> markersList = [];

    markersList.clear();
    for (var i = 0; i < product.lat.length; i++) {
      markersList.add(Marker(
          onTap: () => mapUser.setCtrlValue(
              text: product.pointNames[i],
              id: product.carId,
              obj: product.pickupPoints[i].id,
              lat: product.lat[i],
              lng: product.lng[i]),
          markerId: MarkerId("$i"),
          infoWindow: InfoWindow(title: "${product.pointNames[i]}"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: LatLng(product.lat[i], product.lng[i])));
    }

    final List<Marker> markers = markersList;
    // created method for getting user current location
    Future<Position> getUserCurrentLocation() async {
      await Geolocator.requestPermission()
          .then((value) {})
          .onError((error, stackTrace) async {
        await Geolocator.requestPermission();
      });
      return await Geolocator.getCurrentPosition();
    }

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await getLocation();
    // });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(resHeight.width, resHeight.width),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                left: resHeight.width * 0.015,
                right: resHeight.width * 0.015,
                top: resHeight.width * 0.04),
            child: Consumer<MapUserProvider>(builder: (context, value, child) {
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
                        child: TextFormField(
                          controller: value.pickupPointCtrl,
                          readOnly: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Select a lcation point"),
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
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGoogle,
          zoomControlsEnabled: false,
          markers: Set<Marker>.of(markers),
          mapType: MapType.hybrid,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          compassEnabled: true,
          trafficEnabled: true,
          onMapCreated: (GoogleMapController controller) async {
            controllers.complete(controller);
            await getUserCurrentLocation();
          },
        ),
      ),
    );
  }
}
