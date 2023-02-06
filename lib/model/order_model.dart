import 'dart:convert';

class OrderModel {
  OrderModel({
    required this.myBookings,
    required this.upComingPickups,
    required this.upComingDropOff,
  });

  List<dynamic> myBookings;
  List<UpComingPickup> upComingPickups;
  List<dynamic> upComingDropOff;

  factory OrderModel.fromRawJson(String str) =>
      OrderModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        myBookings: List<dynamic>.from(json["myBookings"].map((x) => x)),
        upComingPickups: List<UpComingPickup>.from(
            json["upComingPickups"].map((x) => UpComingPickup.fromJson(x))),
        upComingDropOff:
            List<dynamic>.from(json["upComingDropOff"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "myBookings": List<dynamic>.from(myBookings.map((x) => x)),
        "upComingPickups":
            List<dynamic>.from(upComingPickups.map((x) => x.toJson())),
        "upComingDropOff": List<dynamic>.from(upComingDropOff.map((x) => x)),
      };
}

/*---------------------------------UPCOMMING ORDER----------------------------*/
class UpComingPickup {
  UpComingPickup({
    required this.id,
    required this.pickupDate,
    required this.pickupTime,
    required this.dropOffDate,
    required this.dropOffTime,
    required this.carId,
    required this.pickup,
    required this.userId,
    required this.price,
    required this.pickupStatus,
    required this.dropOffStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.carData,
  });

  String id;
  String pickupDate;
  String pickupTime;
  String dropOffDate;
  String dropOffTime;
  String carId;
  Pickup pickup;
  String userId;
  int price;
  bool pickupStatus;
  bool dropOffStatus;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  CarData carData;

  factory UpComingPickup.fromRawJson(String str) =>
      UpComingPickup.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpComingPickup.fromJson(Map<String, dynamic> json) => UpComingPickup(
        id: json["_id"],
        pickupDate: json["pickupDate"],
        pickupTime: json["pickupTime"],
        dropOffDate: json["dropOffDate"],
        dropOffTime: json["dropOffTime"],
        carId: json["carId"],
        pickup: Pickup.fromJson(json["pickup"]),
        userId: json["userId"],
        price: json["price"],
        pickupStatus: json["pickupStatus"],
        dropOffStatus: json["dropOffStatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        carData: CarData.fromJson(json["carData"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "pickupDate": pickupDate,
        "pickupTime": pickupTime,
        "dropOffDate": dropOffDate,
        "dropOffTime": dropOffTime,
        "carId": carId,
        "pickup": pickup.toJson(),
        "userId": userId,
        "price": price,
        "pickupStatus": pickupStatus,
        "dropOffStatus": dropOffStatus,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "carData": carData.toJson(),
      };
}

class CarData {
  CarData({
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
  List<DateTime> bookedDates;
  bool isActive;
  String verified;
  List<String> photos;
  List<String> documents;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory CarData.fromRawJson(String str) => CarData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CarData.fromJson(Map<String, dynamic> json) => CarData(
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
        bookedDates: List<DateTime>.from(
            json["bookedDates"].map((x) => DateTime.parse(x))),
        isActive: json["isActive"],
        verified: json["verified"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        documents: List<String>.from(json["documents"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
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
        "bookedDates":
            List<dynamic>.from(bookedDates.map((x) => x.toIso8601String())),
        "isActive": isActive,
        "verified": verified,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "documents": List<dynamic>.from(documents.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Pickup {
  Pickup({
    required this.coords,
    required this.name,
    required this.id,
  });

  Coords coords;
  String name;
  String id;

  factory Pickup.fromRawJson(String str) => Pickup.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pickup.fromJson(Map<String, dynamic> json) => Pickup(
        coords: Coords.fromJson(json["coords"]),
        name: json["name"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "coords": coords.toJson(),
        "name": name,
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
