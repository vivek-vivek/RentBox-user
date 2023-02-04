import 'dart:convert';

class SingleCarModel {
  SingleCarModel({
    required this.car,
  });

  SingleCar car;

  factory SingleCarModel.fromRawJson(String str) =>
      SingleCarModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SingleCarModel.fromJson(Map<String, dynamic> json) => SingleCarModel(
        car: SingleCar.fromJson(json["car"]),
      );

  Map<String, dynamic> toJson() => {
        "car": car.toJson(),
      };
}

class SingleCar {
  SingleCar({
    required this.id,
    required this.gearType,
    required this.fuelType,
    required this.seatNum,
    required this.location,
    required this.pickupPoints,
    required this.vendor,
    required this.name,
    required this.price,
    required this.rcNumber,
    required this.bookedTime,
    required this.bookedDates,
    required this.isActive,
    required this.verified,
    required this.photos,
    required this.documents,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.availableLocation,
  });

  String id;
  String gearType;
  String fuelType;
  int seatNum;
  String location;
  List<String> pickupPoints;
  String vendor;
  String name;
  int price;
  int rcNumber;
  List<dynamic> bookedTime;
  List<dynamic> bookedDates;
  bool isActive;
  String verified;
  List<String> photos;
  List<String> documents;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  AvailableLocation availableLocation;

  factory SingleCar.fromRawJson(String str) =>
      SingleCar.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SingleCar.fromJson(Map<String, dynamic> json) => SingleCar(
        id: json["_id"],
        gearType: json["gearType"],
        fuelType: json["fuelType"],
        seatNum: json["seatNum"],
        location: json["location"],
        pickupPoints: List<String>.from(json["pickupPoints"].map((x) => x)),
        vendor: json["vendor"],
        name: json["name"],
        price: json["price"],
        rcNumber: json["rcNumber"],
        bookedTime: List<dynamic>.from(json["bookedTime"].map((x) => x)),
        bookedDates: List<dynamic>.from(json["bookedDates"].map((x) => x)),
        isActive: json["isActive"],
        verified: json["verified"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        documents: List<String>.from(json["documents"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        availableLocation:
            AvailableLocation.fromJson(json["availableLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "gearType": gearType,
        "fuelType": fuelType,
        "seatNum": seatNum,
        "location": location,
        "pickupPoints": List<dynamic>.from(pickupPoints.map((x) => x)),
        "vendor": vendor,
        "name": name,
        "price": price,
        "rcNumber": rcNumber,
        "bookedTime": List<dynamic>.from(bookedTime.map((x) => x)),
        "bookedDates": List<dynamic>.from(bookedDates.map((x) => x)),
        "isActive": isActive,
        "verified": verified,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "documents": List<dynamic>.from(documents.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "availableLocation": availableLocation.toJson(),
      };
}

class AvailableLocation {
  AvailableLocation({
    required this.id,
    required this.coords,
    required this.location,
    required this.image,
    required this.isActive,
    required this.pickupPoints,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  Coords coords;
  String location;
  String image;
  bool isActive;
  List<PickupPoint> pickupPoints;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory AvailableLocation.fromRawJson(String str) =>
      AvailableLocation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AvailableLocation.fromJson(Map<String, dynamic> json) =>
      AvailableLocation(
        id: json["_id"],
        coords: Coords.fromJson(json["coords"]),
        location: json["location"],
        image: json["image"],
        isActive: json["isActive"],
        pickupPoints: List<PickupPoint>.from(
            json["pickupPoints"].map((x) => PickupPoint.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "coords": coords.toJson(),
        "location": location,
        "image": image,
        "isActive": isActive,
        "pickupPoints": List<dynamic>.from(pickupPoints.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
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

class PickupPoint {
  PickupPoint({
    required this.name,
    required this.coords,
    required this.id,
  });

  String name;
  Coords coords;
  String id;

  factory PickupPoint.fromRawJson(String str) =>
      PickupPoint.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickupPoint.fromJson(Map<String, dynamic> json) => PickupPoint(
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
