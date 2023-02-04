// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

class SearchModel {
  SearchModel({
    required this.cars,
    required this.time,
    required this.pickups,
  });

  List<Car> cars;
  Time time;
  List<Pickup> pickups;

  factory SearchModel.fromRawJson(String str) =>
      SearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        cars: List<Car>.from(json["cars"].map((x) => Car.fromJson(x))),
        time: Time.fromJson(json["time"]),
        pickups:
            List<Pickup>.from(json["pickups"].map((x) => Pickup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cars": List<dynamic>.from(cars.map((x) => x.toJson())),
        "time": time.toJson(),
        "pickups": List<dynamic>.from(pickups.map((x) => x.toJson())),
      };
}

class Car {
  Car({
    required this.id,
    required this.gearType,
    required this.fuelType,
    required this.seatNum,
    required this.location,
    required this.vendor,
    required this.name,
    required this.price,
    required this.photos,
  });

  String id;
  String gearType;
  String fuelType;
  int seatNum;
  String location;
  String vendor;
  String name;
  int price;
  List<String> photos;

  factory Car.fromRawJson(String str) => Car.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["_id"],
        gearType: json["gearType"],
        fuelType: json["fuelType"],
        seatNum: json["seatNum"],
        location: json["location"],
        vendor: json["vendor"],
        name: json["name"],
        price: json["price"],
        photos: List<String>.from(json["photos"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "gearType": gearType,
        "fuelType": fuelType,
        "seatNum": seatNum,
        "location": location,
        "vendor": vendor,
        "name": name,
        "price": price,
        "photos": List<dynamic>.from(photos.map((x) => x)),
      };
}

class Pickup {
  Pickup({
    required this.name,
    required this.coords,
    required this.id,
  });

  String name;
  Coords coords;
  String id;

  factory Pickup.fromRawJson(String str) => Pickup.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pickup.fromJson(Map<String, dynamic> json) => Pickup(
        name: json["name"],
        coords: Coords.fromJson(json["coords"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "coords": coords.toJson(),
        "_id": id,
      };
}

class Coords {
  Coords({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory Coords.fromRawJson(String str) => Coords.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Time {
  Time({
    required this.pickupDate,
    required this.dropOffDate,
    required this.pickupTime,
    required this.dropOffTime,
    required this.rentPeriod,
  });

  String pickupDate;
  String dropOffDate;
  String pickupTime;
  String dropOffTime;
  int rentPeriod;

  factory Time.fromRawJson(String str) => Time.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        pickupDate: json["pickupDate"],
        dropOffDate: json["dropOffDate"],
        pickupTime: json["pickupTime"],
        dropOffTime: json["dropOffTime"],
        rentPeriod: json["rentPeriod"],
      );

  Map<String, dynamic> toJson() => {
        "pickupDate": pickupDate,
        "dropOffDate": dropOffDate,
        "pickupTime": pickupTime,
        "dropOffTime": dropOffTime,
        "rentPeriod": rentPeriod,
      };
}
