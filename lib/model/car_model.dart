import 'dart:convert';

List<CarModel> carModelFromJson(String str) =>
    List<CarModel>.from(json.decode(str).map((x) => CarModel.fromJson(x)));

String carModelToJson(List<CarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarModel {
  CarModel({
    required this.id,
    required this.seatNum,
    required this.location,
    required this.pickup,
    required this.name,
    required this.price,
    required this.rcNumber,
    required this.availableTime,
    required this.verified,
    required this.phots,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.vendor,
  });

  String id;
  int seatNum;
  String location;
  List<dynamic> pickup;
  String name;
  int price;
  int rcNumber;
  List<DateTime> availableTime;
  bool verified;
  List<String> phots;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String vendor;

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        id: json["_id"],
        seatNum: json["seatNum"],
        location: json["location"],
        pickup: List<dynamic>.from(json["pickup"].map((x) => x)),
        name: json["name"],
        price: json["price"],
        rcNumber: json["rcNumber"],
        availableTime: List<DateTime>.from(
            json["availableTime"].map((x) => DateTime.parse(x))),
        verified: json["verified"],
        phots: List<String>.from(json["phots"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        vendor: json["vendor"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "seatNum": seatNum,
        "location": location,
        "pickup": List<dynamic>.from(pickup.map((x) => x)),
        "name": name,
        "price": price,
        "rcNumber": rcNumber,
        "availableTime":
            List<dynamic>.from(availableTime.map((x) => x.toIso8601String())),
        "verified": verified,
        "phots": List<dynamic>.from(phots.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "vendor": vendor,
      };
}
