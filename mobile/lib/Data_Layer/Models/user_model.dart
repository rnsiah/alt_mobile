import 'atrocity_model.dart';
import 'non_profit_model.dart';
import 'shirt_model.dart';

class User {
  int id;
  String email;
  String key;
  int altid;
  int hasProfile;

  User(
      {required this.id,
      required this.key,
      required this.email,
      required this.altid,
      required this.hasProfile});

  int getUserId(User user) {
    return this.altid;
  }

  factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
      id: data['id'],
      email: data['email'],
      key: data['key'],
      altid: data['altid'],
      hasProfile: data['hasProfile']);

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "email": this.email,
        "key": this.key,
        "altid": this.altid,
        "hasProfile": this.hasProfile
      };
}

class Profile {
  Profile({
    required this.username,
    required this.user,
    required this.title,
    required this.dob,
    required this.address,
    required this.country,
    required this.city,
    required this.zip,
    required this.qrCode,
    required this.shirtList,
    required this.atrocityList,
    required this.nonProfitList,
  });
  int user;
  String username;
  String title;
  String dob;
  String address;
  String country;
  String city;
  String zip;
  String qrCode;
  List<Shirt> shirtList;
  List<Atrocity> atrocityList;
  List<NonProfit> nonProfitList;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        user: json['user'],
        username: json['username'],
        title: json["title"],
        dob: json["dob"],
        address: json["address"],
        country: json["country"],
        city: json["city"],
        zip: json["zip"],
        qrCode: json["qr_code"],
        shirtList:
            List<Shirt>.from(json["shirt_list"].map((x) => Shirt.fromJson(x))),
        atrocityList: List<Atrocity>.from(
            json["atrocity_list"].map((x) => Atrocity.fromJson(x))),
        nonProfitList:
            List<NonProfit>.from(json["nonProfit_list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        "user": user,
        "title": title,
        "dob": dob,
        "address": address,
        "country": country,
        "city": city,
        "zip": zip,
        "qr_code": qrCode,
        "shirt_list": List<dynamic>.from(shirtList.map((x) => x.toJson())),
        "atrocity_list":
            List<dynamic>.from(atrocityList.map((x) => x.toJson())),
        "nonProfit_list": List<dynamic>.from(nonProfitList.map((x) => x)),
      };
}

class ProfileCompletion {
  String username;
  String title;
  String dob;
  String address;
  String city;
  String country;
  String zip;

  ProfileCompletion(
      {required this.username,
      required this.title,
      required this.dob,
      required this.address,
      required this.city,
      required this.country,
      required this.zip});

  Map<String, dynamic> toJson() => {
    "username": this.username,
    "title":this.title,
    "dob":this.dob,
    "address": this.address,
    "city": this.city,
    "country": this.country,
    "zip":this.zip,
  };
}
